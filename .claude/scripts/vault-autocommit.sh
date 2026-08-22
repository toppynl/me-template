#!/usr/bin/env bash
# vault-autocommit.sh — detached, fail-open auto-commit for this vault repo.
#
# Fires on the SessionEnd hook (real session exit, not every turn). Stages
# vault-relevant paths, secret-scans the staged diff, commits, and pushes in
# the background. Never blocks: every failure path exits 0.
#
# This is opt-in machinery shipped by the template — review it, and the
# `git push` line in particular, before relying on it. Delete the SessionEnd
# hook in .claude/settings.json if you don't want auto-commit at all, or
# drop just the push line below if you want local auto-commits without
# auto-push.
#
# Kill switch: VAULT_AUTOCOMMIT=0

# Fail-open: whatever happens inside main, we always exit 0 at the bottom.
main() {
  set -u

  # Kill switch.
  if [ "${VAULT_AUTOCOMMIT:-1}" = "0" ]; then
    return 0
  fi

  cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || return 0

  # Mid-merge: leave it alone.
  local git_dir
  git_dir="$(git rev-parse --git-dir 2>/dev/null)" || return 0
  if [ -f "$git_dir/MERGE_HEAD" ]; then
    return 0
  fi

  # Nothing to do.
  if [ -z "$(git status --porcelain 2>/dev/null)" ]; then
    return 0
  fi

  # Stage only vault-relevant paths. Adjust this list if you rename/add
  # top-level directories after onboarding.
  git add -- \
    wiki/ now/ hot.md index.md log.md me/ CLAUDE.md _templates/ .claude/ \
    2>/dev/null

  # Nothing staged (e.g. only ignored/stray files changed) -> nothing to do.
  if git diff --cached --quiet 2>/dev/null; then
    return 0
  fi

  # Secret scan on staged content.
  local staged
  staged="$(git diff --cached -U0 2>/dev/null)"
  local hit=""
  if printf '%s' "$staged" | grep -qE 'AKIA[0-9A-Z]{16}'; then
    hit="AWS access key pattern"
  elif printf '%s' "$staged" | grep -qE -- '-----BEGIN[A-Z ]*PRIVATE KEY-----'; then
    hit="private key block"
  elif printf '%s' "$staged" | grep -qE 'gh[pos]_[A-Za-z0-9]{20,}'; then
    hit="GitHub token pattern"
  elif printf '%s' "$staged" | grep -qEi '(api[_-]?key|secret|password|token)[[:space:]]*[:=][[:space:]]*['"'"'"][^'"'"'"]{12,}['"'"'"]'; then
    hit="generic credential pattern"
  fi

  if [ -n "$hit" ]; then
    echo "vault-autocommit: possible secret detected ($hit) — skipping commit, unstaging." >&2
    git reset >/dev/null 2>&1
    return 0
  fi

  # Commit.
  local stat_summary
  stat_summary="$(git diff --cached --stat 2>/dev/null | tail -n +1)"
  local msg
  msg="$(printf 'vault: auto-commit session changes\n\n%s' "$stat_summary")"
  git commit -q -m "$msg" >/dev/null 2>&1 || return 0

  # Push in the background, detached, non-blocking. Only fires if this repo
  # has a configured remote/upstream — a fresh clone with no push access
  # (or a solo local-only vault) just no-ops here.
  ( git push >/dev/null 2>&1 & ) >/dev/null 2>&1

  return 0
}

main
exit 0
