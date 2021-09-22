#!/bin/bash
set -euo pipefail
TEST_DIR="/tmp/test-repository"
DATA_DIR="$(cd .. && pwd)"
rm -rf "$TEST_DIR"
mkdir -p "$TEST_DIR"
cd "$TEST_DIR"
cp "$DATA_DIR/branchmark.sh" .
cp "$DATA_DIR/test/branchmark-test.config" ./branchmark.config
git init
touch some_file other_file
git add some_file
git commit -m "Initial commit"
git checkout -b development
git add other_file
git commit -m "Second commit"
chmod +x branchmark.sh
./branchmark.sh
if cmp --silent "$DATA_DIR/test/expected.log" "./testfile.log"; then
    echo "OK"
else
    echo "FAILED: Program output differs."
fi
rm -rf "$TEST_DIR"
