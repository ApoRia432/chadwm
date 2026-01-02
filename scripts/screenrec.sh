#!/usr/bin/env bash

## requirements
# - slurp
# $ xi slurp
# - wl-screenrec
# $ cargo install wl-screenrec
#

OUTPUT_DIR="$HOME/Videos"
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

start_recording() {
    local filename="$OUTPUT_DIR/ScreenRecord-$(date +'%Y-%m-%d_%H-%M-%S').mp4"
    local monitor=$(xrandr --listmonitors | grep -v "Monitors:" | awk '{print $4}' | rofi -dmenu -p "Select monitor to record:")

    if [ ! -z "$monitor" ]; then
        notify-send "Screen recording started."
        gpu-screen-recorder -w "$monitor" -f 60 -a "default_output" -o "$filename" &
    fi
}

stop_recording() {
    pkill -SIGINT -f "gpu-screen-recorder"
    notify-send "Screen recording saved to $OUTPUT_DIR"
}

if pgrep -f "gpu-screen-recorder" > /dev/null; then
    stop_recording
else
    start_recording
fi
