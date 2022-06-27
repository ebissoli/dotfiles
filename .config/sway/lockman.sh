#!/usr/bin/env bash

swayidle \
    timeout 10 'swaymsg "output * dpms off" && playerctl -a pause' \
    resume 'swaymsg "output * dpms on" && playerctl -a play' \
    unlock 'playerctl -a pause' &
swaylock -i "$HOME/.config/Wallpaper/dragon.png"
kill %%
