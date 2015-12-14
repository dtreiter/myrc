#!/bin/bash

# The source directory and target directories.
SOURCE="$PWD"
TARGET="$(echo $HOME)"

FILES="$(find . -name '*.symlink')"
for FILE in $FILES; do
    SOURCE_FILE=$(basename "$FILE")
    TARGET_FILE="${SOURCE_FILE%.*}"
    echo "Linking $SOURCE/$SOURCE_FILE to $TARGET/$TARGET_FILE"
    ln -s "$SOURCE/$SOURCE_FILE" "$TARGET/$TARGET_FILE"
done
