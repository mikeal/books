#!/usr/bin/env zsh

# Set metadata variables
AUTHORS="Mikeal Rogers, Many Others"
TITLE="Practicing"
TAGS="Buddhism, Mind, Mind-Only, Dharma, Agama, Sutra"
COVER_IMAGE="practicing/cover.jpg"
PUBDATE=$(date +%Y-%m-%d)
PUBLISHER="Free Dharma"
LANGUAGE="en"
ACCESSIBILITY_SUMMARY="This document is designed with accessibility features, structured headings, clear language, and compatibility with screen readers and other assistive technologies. Proper language tags are used to ensure appropriate language identification and Noto Sans fonts are included for all languages."

# Function to concatenate all files
concat_files() {
    echo "---"
    echo "title: \"$TITLE\""
    echo "author: \"$AUTHORS\""
    echo "tags: \"$TAGS\""
    echo "cover-image: \"$COVER_IMAGE\""
    echo "publisher: \"$PUBLISHER\""
    echo "date: \"$PUBDATE\""
    echo "language: \"$LANGUAGE\""
    echo "schema:accessibilitySummary: \"$ACCESSIBILITY_SUMMARY\""
    echo "---"


    # Iterating through ../sutras and ../original directories recursively for markdown files
    for dir in "../free-dharma" "../LUSB"; do
        echo "# Contents from $(basename $dir)/"
        echo ""
        echo ""
        # Find and sort the files
        find "$dir" -type f -name "*.md" | sort | while read -r file; do
            # Get the relative directory path and file name
            relative_path="${file#$dir/}"
            # Print the relative path as a heading
            echo "## $relative_path"
            echo ""
            echo ""
            # Print the contents of the markdown file
            cat "$file" | ./increment-headers.sh \#\#
            echo ""
            echo "" # Adding a line break after each file's content
        done
    done


    echo ""
    echo "# Build Information"
    echo "\nThis ebook and its build process are open source and [available on GitHub](https://github.com/mikeal/books)."
}

concat_files
