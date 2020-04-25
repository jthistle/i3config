#!/usr/bin/env bash


regex="layout:\s+([a-zA-Z,]+)"


i3status --config ~/.i3/i3status.conf | while :
do
        read line

        output=$(setxkbmap -query)
        match=""
        if [[ $output =~ $regex ]]; then
            match="${BASH_REMATCH[1]}"
        fi
        echo "$match | $line" || exit 1
done