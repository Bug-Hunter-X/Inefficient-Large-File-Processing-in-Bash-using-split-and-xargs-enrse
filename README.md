# Inefficient Large File Processing in Bash

This repository demonstrates a common error when using `split` and `xargs` in bash scripts to process large files. The script attempts to efficiently process a large file by splitting it into smaller chunks and then processing each chunk individually. However, due to an incorrect usage of `xargs`, all chunks are passed as a single argument to the processing script.

## Bug Description
The primary issue lies in how `xargs` is invoked. Using `xargs -0 -I {} sh -c 'process_chunk.sh {}'` executes the command `process_chunk.sh {}` only once, passing all filenames as a single, long argument to the `process_chunk.sh` script, which is likely to lead to processing errors or unexpected behavior. The solution involves modifying the xargs command to pass only one filename at a time.

## Solution
The corrected script uses `xargs -0 -n1` to ensure that each chunk is passed to `process_chunk.sh` as a separate argument.