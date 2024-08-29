#!/usr/bin/env zsh

usage() {
    echo "Usage: $0 -o OUTPUT_FILE"
    exit 1
}

# Parse command line arguments
while getopts ":o:" opt; do
  case $opt in
    o)
      OUTPUT_FILE=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      ;;
  esac
done

# Verify that all required arguments are provided
if [ -z "$OUTPUT_FILE" ]; then
    usage
fi

# Get the current git commit hash
GIT_COMMIT=$(git rev-parse --short HEAD)

# Check if we are in GitHub Actions environment
if [[ -n $GITHUB_ACTIONS ]]; then
    BUILD_TYPE="autobuild"
else
    BUILD_TYPE="localbuild"
fi

PUBDATE=$(date +%Y-%m-%d)  # Set current date dynamically
BUILD_INFO="$BUILD_TYPE $PUBDATE $GIT_COMMIT"

# Define the temporary markdown file
TMP_MD=$(./tmpfile.sh ebook.md)

# Read from stdin and write to the temporary markdown file
cat /dev/stdin > "$TMP_MD"

## TODO: cat build info as markdown to TMP_MD

# Collect all fonts to embed
FONT_EMBED_OPTIONS=()
for font in ./fonts/*; do
    FONT_EMBED_OPTIONS+=("--epub-embed-font=$font")
done

# Convert markdown to EPUB using pandoc with specified options
pandoc -f markdown+hard_line_breaks+pipe_tables+fenced_code_blocks+yaml_metadata_block+line_blocks+smart+fancy_lists+link_attributes "$TMP_MD" -o "$OUTPUT_FILE" \
--css "./styles/book.css" \
--toc --toc-depth=3 --split-level=2 \
"${FONT_EMBED_OPTIONS[@]}"

# Clean up temporary files
rm "$TMP_MD"
