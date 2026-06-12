#!/usr/bin/env sh
export XSECURELOCK_SAVER=saver_mpv
export XSECURELOCK_LIST_VIDEOS_COMMAND="echo ~/.local/state/current-wallpaper"
export XSECURELOCK_FONT="Hack:size=11"
export XSECURELOCK_AUTH_TIMEOUT=5
export XSECURELOCK_AUTH_CURSOR_BLINK=0
export XSECURELOCK_PASSWORD_PROMPT=time_hex
xsecurelock
