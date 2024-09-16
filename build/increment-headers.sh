#!/bin/bash

# Check if at least one argument is passed
if [ $# -lt 1 ]; then
  echo "Usage: $0 <increment>"
  exit 1
fi

# Get the increment string
increment="$1"

# Read from stdin and process each line
while IFS= read -r line; do
  # Check if the line starts with a header (one or more # characters followed by a space)
  if [[ $line =~ ^(#+)(\ .*) ]]; then
    # Extract the current header level
    current_header="${BASH_REMATCH[1]}"
    # Extract the rest of the line
    rest_of_line="${BASH_REMATCH[2]}"
    # Increment the header level
    new_header="${increment}${current_header}"
    # Print the new header line
    echo "${new_header}${rest_of_line}"
  else
    # Print the line as is if it's not a header
    echo "$line"
  fi
done
