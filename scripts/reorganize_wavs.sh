#!/usr/bin/env bash
set -euo pipefail

# Reorganize wav files in repo root into folders:
#  - text/  <- *_text.wav
#  - word/  <- *_words_*.wav
# Keeps image/ unchanged.
# This script:
# 1) Clones the repo to a temporary directory
# 2) Creates a backup branch (pushes it)
# 3) Moves files with git mv into text/ and word/
# 4) Commits and pushes the changes to main
# Requirements: you must have push access to the repository and git configured.

REPO_URL="https://github.com/sixgodgood/MTSD-S-speech-subset.git"
TMP_DIR=$(mktemp -d)
TS=$(date +%Y%m%d%H%M%S)
BACKUP_BRANCH="backup/reorg-wav-${TS}"

echo "Cloning ${REPO_URL} into ${TMP_DIR}"
git clone "${REPO_URL}" "${TMP_DIR}"
cd "${TMP_DIR}"

echo "Creating backup branch ${BACKUP_BRANCH} from main and pushing it"
# Make sure we are up to date
git checkout main
git pull --rebase origin main

git checkout -b "${BACKUP_BRANCH}"
# push backup branch
git push -u origin "${BACKUP_BRANCH}"

# Switch back to main to apply moves
git checkout main
git pull --rebase origin main

# Create target directories
mkdir -p text word

echo "Moving *_text.wav -> text/"
shopt -s nullglob || true
# Use a loop so missing pattern doesn't fail
moved=0
for f in *_text.wav; do
  echo "  git mv '$f' text/"
  git mv -- "$f" text/ || mv -- "$f" text/ && git add "text/$f"
  moved=1
done

echo "Moving *_words_*.wav -> word/"
for f in *_words_*.wav; do
  echo "  git mv '$f' word/"
  git mv -- "$f" word/ || mv -- "$f" word/ && git add "word/$f"
  moved=1
done

if [ "$moved" -eq 0 ]; then
  echo "No matching wav files found to move. Exiting without committing."
  exit 0
fi

# Show status for review
echo
echo "Git status (preview):"
git status --porcelain

echo
read -p "Proceed to commit and push these changes to main? (y/N) " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "Aborting. No changes pushed. You can inspect the repo at ${TMP_DIR}."
  exit 1
fi

# Commit and push
git commit -m "Reorganize wav files: move *_text.wav -> text/ and *_words_*.wav -> word/" || true

echo "Pushing changes to origin/main"
git push origin main

echo "Done. Backup branch was pushed as ${BACKUP_BRANCH}."

echo "If you want to undo the main commit after push, you can run:\n  git revert <commit_hash> (on main) or restore from the backup branch."

# Keep the temp directory for inspection
echo "Working copy is kept at: ${TMP_DIR} (delete manually when finished)"
