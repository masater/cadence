#!/bin/bash
cd "$(dirname "$0")"

msgs=(
  "added a space. felt right."
  "took space away. balance restored."
  "breathing in."
  "breathing out."
  "the repo needed this."
  "silence between notes."
  "nothing changed. everything shifted."
  "still here."
  "a space appeared. don't question it."
  "removed a space. it was time."
  "cadence."
  "the commit is the art."
  "less is more. or more is less."
  "you wouldn't get it."
  "aura +1"
  "presence logged."
  "the grid stays active."
  "proof of existence."
  "the space was unnecessary. or was it."
  "maintaining frequency."
)

while true; do
  msg="${msgs[$(( RANDOM % ${#msgs[@]} ))]}"

  if grep -q 'valuable ' README.md; then
    printf '# cadence\nvisible ≠ valuable\n' > README.md
  else
    printf '# cadence\nvisible ≠ valuable \n' > README.md
  fi

  git add README.md
  git commit -m "$msg"
  git push origin dev
  git checkout main && git merge dev && git push origin main && git checkout dev
  sleep $(( RANDOM % 10801 + 3600 ))
done
