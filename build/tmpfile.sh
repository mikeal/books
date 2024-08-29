#!/usr/bin/env zsh

# Check if a filename was provided
if [ -z "$1" ]; then
    echo "Usage: $0 target_filename"
    exit 1
fi

# Determine the temporary directory path
if command -v cygpath >/dev/null 2>&1; then
    # Windows with Cygwin/MSYS2
    TMP_DIR=$(cygpath -u "$TEMP")/tmp.$(date +%s%N)
elif [ -d "/tmp" ]; then
    # Unix-like systems with a /tmp directory
    TMP_DIR="/tmp/tmp.$(date +%s%N)"
else
    # Fallback to HOME directory
    TMP_DIR="$HOME/tmp.$(date +%s%N)"
fi

# Create the unique temporary directory
mkdir -p "$TMP_DIR"

# Check if the directory was created successfully
if [ ! -d "$TMP_DIR" ]; then
    echo "Failed to create a temporary directory: $TMP_DIR"
    exit 1
fi

# Append the target filename to the temporary directory path
TMP_FILE="$TMP_DIR/$1"

# Create the target file
touch "$TMP_FILE"

# Check if the file was created successfully
if [ ! -f "$TMP_FILE" ]; then
    echo "Failed to create a temporary file: $TMP_FILE"
    exit 1
fi

# Output the full path of the temporary file
echo "$TMP_FILE"
