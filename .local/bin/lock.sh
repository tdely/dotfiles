#!/usr/bin/env sh
export XSECURELOCK_SAVER=saver_mpv
export XSECURELOCK_LIST_VIDEOS_COMMAND="echo ~/Pictures/Wallpapers/wallpaper.mp4"
export XSECURELOCK_FONT="Pixelon:size=12"
export XSECURELOCK_AUTH_TIMEOUT=5
export XSECURELOCK_AUTH_CURSOR_BLINK=0
export XSECURELOCK_PASSWORD_PROMPT=time_hex
xsecurelock
