#!/bin/bash

# This script attempts to process a large file efficiently using `split` and `xargs`.
# However, it contains a subtle bug related to how `xargs` handles arguments.

input_file="large_file.txt"

# Split the input file into smaller chunks.
split -l 1000 "$input_file" "$input_file"-

# Process each chunk using xargs.  The problem is here.  The command is passed as one long line to a single process, not once per chunk!
find . -maxdepth 1 -name "$input_file"* -print0 | xargs -0 -I {} sh -c 'process_chunk.sh {}'

# Dummy process_chunk.sh script
echo "Processing chunk: " $1