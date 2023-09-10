#!/bin/bash

# Usage: ./validatedblist.sh <file_path>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi
file_path="$1"

# Remove all spaces, tabs, and empty lines from the file
sed -i '/^[[:space:]]*$/d' "$file_path"

echo "Removed all spaces and tabs from the file."
