#!/bin/bash

i3status --config ~/.i3status.conf | while :
do
    read line
    LG=$(setxkbmap -query | awk '/layout/{print $2}')
    if [ $LG == "latam" ]
    then
        dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#4107D2\" },"
    else
        dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#10EC14\" },"
    fi
    echo "${line/[/$dat}" || exit 1
done
