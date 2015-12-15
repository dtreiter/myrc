#!/bin/bash

# The source directory and target directories.
source="$PWD"
target="$(echo $HOME)"

files="$(find . -name '*.symlink')"
for file in $files; do
    source_file=$(basename "$file")
    target_file="${source_file%.*}"
    echo "Linking $source/$source_file to $target/$target_file"
    ln -s "$source/$source_file" "$target/$target_file"
done
