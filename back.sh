#!/bin/bash

# This script copies all of my configs here for backup...

mkdir -p zsh

cp -r ~/.config/waybar .
cp -r ~/.config/hypr .
cp -r ~/.config/fastfetch .
cp -r ~/.config/kitty .
cp -r ~/.config/nvim .
cp ~/.zshrc zsh

timestamp=$(date "+%Y-%m-%d %H:%M:%S")

if git remote get-url origin >/dev/null 2>&1; then
    git add .

    if ! git diff --cached --quiet; then
        git commit -m "backed up at $timestamp"
    else
        echo "No changes to commit"
    fi

    git push
    echo "Backup completed at: $timestamp"
else
    echo "No github repo configured"
fi
