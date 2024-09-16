#!/bin/bash

# Temporary files to store the outputs
output_default=$(mktemp)
output_awk=$(mktemp)

# Function to clean up temporary files on exit
cleanup() {
    rm -f "$output_default" "$output_awk"
}
trap cleanup EXIT

# Read input from stdin and store it in a variable
input=$(cat)

# Pipe the input to ./add-languages.sh with default settings
echo "$input" | ./add-languages.sh  --use-perl> "$output_default"

# Pipe the input to ./add-languages.sh with --use-awk flag
echo "$input" | ./add-languages.sh --use-gawk > "$output_awk"

# Show the diff between the two outputs
diff "$output_default" "$output_awk"
