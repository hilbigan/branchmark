#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

TEST_DIR="/tmp/test-repository"
DATA_DIR="$(cd .. && pwd)"

# set up test directory and copy files
rm -rf "$TEST_DIR"
mkdir -p "$TEST_DIR"

cd "$TEST_DIR"
cp "$DATA_DIR/branchmark.sh" .
cp "$DATA_DIR/test/branchmark-test.config" ./branchmark.config

# create repo and branches
git init
touch some_file other_file
git add some_file
git commit -m "Initial commit"
git checkout -b development
git add other_file
git commit -m "Second commit"

# run
chmod +x branchmark.sh
./branchmark.sh

# compare output
if cmp --silent "$DATA_DIR/test/expected.log" "./testfile.log"; then
    echo "OK"
else
    echo "FAILED: Program output differs."
fi

# clean up
rm -rf "$TEST_DIR"
