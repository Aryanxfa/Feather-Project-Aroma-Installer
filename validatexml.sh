#!/usr/bin/env bash

set -e

# Function to validate a single XML file
validate_xml_file() {
    xmlstarlet val "$1" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo "Validation error in file: $1"
        exit 11
    fi
}

# Export the function to make it available for parallel execution
export -f validate_xml_file

# Find all XML files recursively and pass them to xargs for parallel processing
find . -type f -name "*.xml" -print0 | xargs -0 -P "$(nproc)" -I {} bash -c 'validate_xml_file "$@"' _ {}

echo "XML files validated successfully."
