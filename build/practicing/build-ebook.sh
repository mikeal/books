#!/usr/bin/env zsh

OUTPUT_FILE="practicing.epub"

./practicing/build-md.sh | ./add-languages.sh --use-gawk | ./ebook.sh -o "$OUTPUT_FILE"
