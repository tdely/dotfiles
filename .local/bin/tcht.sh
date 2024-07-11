#!/usr/bin/env sh
listfile="/tmp/cht.sh.list"

if ! [ -f $listfile ]; then
    curl --silent cht.sh/:list -o $listfile
fi

sel=`cat $listfile | fzf`
[ -z $sel ] && exit 0

read -p "Keyword search (empty to skip): " query

[ -z $query ] || query=`echo "~$query" | tr ' ' '+'`

tmux neww -n cht-sh sh -c "curl --silent cht.sh/$sel$query | less -R"
