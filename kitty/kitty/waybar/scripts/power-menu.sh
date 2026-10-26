#!/usr/bin/env bash
choice=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" \
  | wofi --dmenu --prompt "Power" --width 260 --height 240 --cache-file /dev/null)

case "$choice" in
  Lock)     hyprlock ;;
  Logout)   hyprctl dispatch exit ;;
  Suspend)  systemctl suspend ;;
  Reboot)   systemctl reboot ;;
  Shutdown) systemctl poweroff ;;
esac
