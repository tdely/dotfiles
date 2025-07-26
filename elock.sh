#!/usr/bin/env sh
# Make sure lock is restarted on crash
while true
do
  xss-lock -n /usr/lib/xsecurelock/dimmer -- ~/.local/bin/lock.sh
done
