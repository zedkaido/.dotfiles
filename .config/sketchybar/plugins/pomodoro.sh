#!/bin/sh

POMO="$(zentime once)"

if [ "$POMO" = "No zentime server running" ]; then
	sketchybar --set "$NAME" label="$(cat ~/SESSION)"
else
	sketchybar --set "$NAME" label="$POMO | $(cat ~/SESSION)"
fi
