#!/bin/bash

# Create a directory for fonts if it doesn't exist
mkdir -p fonts

# Function to download files
download_file() {
    local url="$1"
    local output="$2"

    # Forming the complete URL for downloading the raw file
    echo "Downloading $url"

    # Download the file
    curl -L -o "$output" "$url"

    if [ $? -ne 0 ]; then
        echo "Failed to download $url"
        exit 1
    fi
}

# Array of URLs for noto-fonts repository
urls_noto_fonts=(
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSans/NotoSans-Regular.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSans/NotoSans-Bold.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSans/NotoSans-Italic.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSans/NotoSans-BoldItalic.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSans/NotoSans-Light.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSans/NotoSans-LightItalic.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSans/NotoSans-Medium.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSans/NotoSans-MediumItalic.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSansDevanagari/NotoSansDevanagari-Regular.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSansDevanagari/NotoSansDevanagari-Bold.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSansDevanagari/NotoSansDevanagari-Italic.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSansDevanagari/NotoSansDevanagari-BoldItalic.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSansDevanagari/NotoSansDevanagari-Light.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSansDevanagari/NotoSansDevanagari-LightItalic.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSansDevanagari/NotoSansDevanagari-Medium.ttf"
    "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSansDevanagari/NotoSansDevanagari-MediumItalic.ttf"
)

# Array of URLs for noto-cjk repository (Traditional Chinese, Taiwanese version)
urls_noto_cjk=(
    "https://github.com/googlefonts/noto-cjk/raw/main/Sans/TC/NotoSansTC-Regular.otf"
    "https://github.com/googlefonts/noto-cjk/raw/main/Sans/TC/NotoSansTC-Bold.otf"
    "https://github.com/googlefonts/noto-cjk/raw/main/Sans/TC/NotoSansTC-Light.otf"
    "https://github.com/googlefonts/noto-cjk/raw/main/Sans/TC/NotoSansTC-Medium.otf"
    # Including Italics if available in the repository
    "https://github.com/googlefonts/noto-cjk/raw/main/Sans/TC/NotoSansTC-Italic.otf"
    "https://github.com/googlefonts/noto-cjk/raw/main/Sans/TC/NotoSansTC-BoldItalic.otf"
    "https://github.com/googlefonts/noto-cjk/raw/main/Sans/TC/NotoSansTC-LightItalic.otf"
    "https://github.com/googlefonts/noto-cjk/raw/main/Sans/TC/NotoSansTC-MediumItalic.otf"
)

# Download the fonts from noto-fonts repository
for url in "${urls_noto_fonts[@]}"; do
    output_file="fonts/$(basename $url)"
    download_file "$url" "$output_file"
done

# Download the fonts from noto-cjk repository
for url in "${urls_noto_cjk[@]}"; do
    output_file="fonts/$(basename $url)"
    download_file "$url" "$output_file"
done

echo "All fonts have been downloaded."
