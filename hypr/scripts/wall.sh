#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/walls"
STYLE="$HOME/.config/wofi/wallpaper/style.css"

SELECTED=$(
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' \
           -o -iname '*.png' -o -iname '*.webp' \) \
        -printf '󰸉  %f\n' |
        sort |
        wofi --dmenu \
            --width 650 \
            --height 500 \
           --conf <(printf 'show=dmenu\nlocation=center\ninsensitive=true\nmatching=fuzzy\n')
            --style "$STYLE"
)

[ -z "$SELECTED" ] && exit 0

# Remove the display icon before resolving the filename.
SELECTED="${SELECTED#󰸉  }"
WALLPAPER="$WALLPAPER_DIR/$SELECTED"

[ -f "$WALLPAPER" ] || exit 1

printf '%s\n' "$WALLPAPER" > "$HOME/.config/hypr/current-wallpaper"

pkill -x swaybg 2>/dev/null || true
swaybg -i "$WALLPAPER" -m fill &

