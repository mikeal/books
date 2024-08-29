#!/usr/bin/env zsh

OUTPUT_FILE="xuanzangs-dependent-origination.epub"

./dependent-origination/build-md.sh | ./add-languages.sh | ./ebook.sh -o "$OUTPUT_FILE"
