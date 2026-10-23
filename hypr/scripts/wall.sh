#!/bin/bash

WALLPAPER_DIR="$HOME/walls"
STATE_FILE="$HOME/.cache/current-wallpaper"

mkdir -p "$HOME/.cache"

mapfile -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) |
    sort
)

if ((${#WALLPAPERS[@]} == 0)); then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

if [[ -f "$STATE_FILE" ]] && [[ -f "$(cat "$STATE_FILE")" ]]; then
    WALLPAPER=$(cat "$STATE_FILE")
else
    WALLPAPER="${WALLPAPERS[0]}"
    echo "$WALLPAPER" > "$STATE_FILE"
fi

if [[ "$1" == "next" ]]; then
    for i in "${!WALLPAPERS[@]}"; do
        if [[ "${WALLPAPERS[$i]}" == "$WALLPAPER" ]]; then
            NEXT=$(( (i + 1) % ${#WALLPAPERS[@]} ))
            WALLPAPER="${WALLPAPERS[$NEXT]}"
            break
        fi
    done
fi

echo "$WALLPAPER" > "$STATE_FILE"
echo "Setting wallpaper to: $WALLPAPER"

pkill -x swaybg 2>/dev/null
swaybg -i "$WALLPAPER" -m fill &





