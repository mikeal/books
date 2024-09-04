#!/usr/bin/env zsh

OUTPUT_FILE="practicing.epub"

./practicing/build-md.sh | ./add-languages.sh | ./ebook.sh -o "$OUTPUT_FILE"
