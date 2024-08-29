#!/bin/bash

# Function to determine if a line contains Chinese characters
contains_chinese_chars() {
    local line="$1"
    # Use Perl to detect Chinese characters
    perl -Mutf8 -CSD -ne 'exit(1) unless /\p{Han}/' <<< "$line"
    echo $?
}

# Function to determine if a line contains Devanagari characters
contains_devanagari_chars() {
    local line="$1"
    # Use Perl to detect Devanagari characters
    perl -Mutf8 -CSD -ne 'exit(1) unless /\p{Devanagari}/' <<< "$line"
    echo $?
}

# Function to determine if a line is predominantly English
contains_english_chars() {
    local line="$1"
    # Use Perl to detect Latin characters
    perl -Mutf8 -CSD -ne 'exit(1) unless /\p{Latin}/' <<< "$line"
    echo $?
}

# Determine if a line is part of the metadata block (YAML front-matter)
is_metadata_line() {
    local line="$1"
    # Match lines with front-matter markers ("---"), key-value pairs, or completely empty lines
    if [[ "$line" =~ ^---$ ]] || [[ "$line" =~ ^.+:\ .+$ ]] || [[ -z "$line" ]]; then
        echo "1"
    else
        echo "0"
    fi
}

# Determine if a line is a Markdown syntax line to be excluded (e.g., code block delimiters)
is_excluded_markdown_syntax() {
    local line="$1"
    # Match lines starting with ``` (code blocks)
    if [[ "$line" =~ ^\`\`\` ]]; then
        echo "1"
    else
        echo "0"
    fi
}

# Set flag to determine if we are in a code block
in_code_block=0

# Read input line by line
while IFS= read -r line || [ -n "$line" ]; do
    # Check if the line is the start or end of a code block
    if [ "$(is_excluded_markdown_syntax "$line")" -eq 1 ]; then
        if [ "$in_code_block" -eq 0 ]; then
            in_code_block=1
        else
            in_code_block=0
        fi
        echo "$line"
    elif [ "$in_code_block" -eq 1 ] || [ "$(is_metadata_line "$line")" -eq 1 ]; then
        echo "$line"
    else
        # Check if the line contains any non-whitespace characters
        if [[ "$line" =~ [^[:space:]] ]]; then
            # Remove trailing whitespace
            line_trimmed=$(echo "$line" | sed 's/[[:space:]]*$//')
            if [ "$(contains_chinese_chars "$line_trimmed")" -eq 0 ]; then
                echo "[$line_trimmed]{lang=zh-Hant}"
            elif [ "$(contains_devanagari_chars "$line_trimmed")" -eq 0 ]; then
                echo "[$line_trimmed]{lang=hi}"
            elif [ "$(contains_english_chars "$line_trimmed")" -eq 0 ]; then
                echo "[$line_trimmed]{lang=en}"
            else
                # Default case; do nothing if no confident prediction
                echo "$line_trimmed"
            fi
        else
            # Preserve empty lines and lines with only whitespace
            echo "$line"
        fi
    fi
done
