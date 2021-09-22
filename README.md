# "branchmark"

Small shell script that checks out several branches and runs some preconfigured commands
on each of them.
Useful for benchmarking different versions of the same program.

## Installing


## Configuration

The included config should be self-explanatory:

```sh
# Branches to checkout
branches=(
"main"
"development"
"test"
)

# Output filter (egrep pattern)
filter="*"

# Function to be benchmarked
function run {
    echo "Bye"
    sleep 1
    echo "World!"
}
```
