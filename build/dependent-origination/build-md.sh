#!/usr/bin/env zsh

# Set metadata variables
AUTHORS="Mikeal Rogers, Xuanzang, Buddha Shakyamuni"
TITLE="Xuanzang's Dependent Origination"
TAGS="Buddhism, Mind, Mind-Only, Dharma, Meditation, Dependent Origination, Agama, Sutra"
COVER_IMAGE="dependent-origination/cover.jpg"
PUBDATE=$(date +%Y-%m-%d)
PUBLISHER="Free Dharma"
LANGUAGE="en,zh"
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
    echo ""
    cat ../free-dharma/sutras/T0124.md
    echo ""
    echo "# Build Information"
    echo "\nThis ebook and its build process are open source and [available on GitHub](https://github.com/mikeal/books)."
}

concat_files
