#!/bin/bash

OUTPUT_DIR="$HOME/Pictures/Screenshots"
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

if ! [[ $(pgrep -x "maim" > /dev/null) ]]; then
    filename="$OUTPUT_DIR/Screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
    maim -s "$filename"
    xclip -selection clipboard -t image/png -i "$filename"
fi
