#!/bin/bash
CONFIG_FILE="./branchmark.config"
set -euo pipefail
IFS=$'\n\t'
cd "$(dirname "$0")"

function log {
    echo -n "[branchmark] "
    echo "$@"
}

ORIGINAL_BRANCH=$(git branch --show-current)
log "Original branch is ${ORIGINAL_BRANCH}."
source "$CONFIG_FILE"

log "Benchmarking ${#branches[@]} branches..."

for name in "${branches[@]}"; do
    if git checkout "$name" >/dev/null 2>&1; then
        log "*** Running on branch $name ***"
        time (run | grep -E --line-buffered "${filter}") || true
        log "*** End run on $name ***"
    else
        log "Failed to checkout $name, skipping."; 
    fi
done

git checkout "$ORIGINAL_BRANCH"
