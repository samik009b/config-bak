#!/usr/bin/env bash

WAYBAR_DIR="$HOME/.config/waybar"
THEME_DIR="$WAYBAR_DIR/themes"
THEME="${1:-}"

if [[ -z "$THEME" ]]; then
    echo "Available Waybar themes:"
    for dir in "$THEME_DIR"/*/; do
        [[ -d "$dir" ]] && printf '  %s\n' "$(basename "$dir")"
    done
    echo
    echo "Usage: waybar-theme <theme-name>"
    exit 0
fi

THEME_PATH="$THEME_DIR/$THEME"

if [[ ! -f "$THEME_PATH/config.jsonc" ||
      ! -f "$THEME_PATH/style.css" ]]; then
    echo "Error: theme '$THEME' must contain config.jsonc and style.css"
    exit 1
fi

cp "$THEME_PATH/config.jsonc" "$WAYBAR_DIR/config.jsonc" &&
cp "$THEME_PATH/style.css" "$WAYBAR_DIR/style.css" || {
    echo "Error: failed to copy theme files."
    exit 1
}

pkill -x waybar 2>/dev/null || true
sleep 0.3
waybar >/tmp/waybar.log 2>&1 &

echo "Switched Waybar theme to: $THEME"
