#!/bin/bash

# This script demonstrates the corrected way to process a large file using `split` and `xargs`.

input_file="large_file.txt"

# Split the input file into smaller chunks.
split -l 1000 "$input_file" "$input_file"-

# Process each chunk using xargs, each chunk as a separate argument to process_chunk.sh
find . -maxdepth 1 -name "$input_file"* -print0 | xargs -0 -n1 -I {} sh -c 'process_chunk.sh {}'

# Dummy process_chunk.sh script
echo "Processing chunk: " $1