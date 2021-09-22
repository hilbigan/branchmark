# "branchmark"

Small shell script that checks out several git branches and runs some preconfigured commands
on each of them.
Useful for benchmarking different versions of the same program.

## Installing

Inside your repo:

```sh
wget https://raw.githubusercontent.com/hilbigan/branchmark/main/branchmark.sh
chmod +x branchmark.sh
# optional: get config template
wget https://raw.githubusercontent.com/hilbigan/branchmark/main/branchmark.config
```


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
    echo "Hello"
    sleep 1
    echo "World!"
}
```
