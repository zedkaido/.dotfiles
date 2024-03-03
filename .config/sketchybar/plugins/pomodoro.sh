#!/bin/zsh

# go install github.com/open-pomodoro/openpomodoro-cli/cmd/pomodoro@latest
sketchybar --set "$NAME" label="$(~/go/bin/pomodoro status) | $(cat ~/SESSION)" 
