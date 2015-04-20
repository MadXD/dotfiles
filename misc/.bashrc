#!/usr/bin/env bash

if [[ -n "${DISPLAY}" ]]; then
    setxkbmap -layout us -variant colemak -option ctrl:nocaps
fi

test -x "/usr/bin/fish" && exec /usr/bin/fish
