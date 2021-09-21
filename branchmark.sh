#!/bin/bash
CONFIG_FILE="./branchmark.config"
set -euo pipefail
IFS=$'\n\t'

source "$CONFIG_FILE"

echo "Benchmarking ${#branches[@]} branches..."

for name in ${branches[@]}; do
    if git checkout "$name" >/dev/null 2>&1; then
        echo "*** Running on branch $name ***"
        time (run | egrep --line-buffered "${filter}")
        echo "*** End run on $name ***"
    else
        echo "Failed to checkout $name, skipping."; 
    fi
done
