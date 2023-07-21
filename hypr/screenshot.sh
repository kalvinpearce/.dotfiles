#!/bin/bash

# file to save screenshot to ~/Pictures/Screenshots/YYYY-MM-DD_HH-MM-SS.png
filename="$HOME/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"

# take screenshot
grim -g "$(slurp)" "$filename"

# copy to clipboard
wl-copy < "$filename"

# notify and get user input
input=$(dunstify -i "$filename" "Screenshot taken and copied to clipboard" "Click to edit" -A yes,EDIT)

# if input == 2 (edit)
if [ "$input" == "2" ]; then
  swappy -f "$filename" -o "$filename"
fi
