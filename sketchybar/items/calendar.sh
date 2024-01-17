#!/bin/bash

sketchybar --add item calendar right                       \
           --set calendar icon=􀧞                           \
                          update_freq=30                   \
                          background.color=off             \
                          script="$PLUGIN_DIR/calendar.sh"
