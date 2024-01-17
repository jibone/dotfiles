#!/bin/bash

sketchybar --add item volume right                     \
           --set volume background.color=off           \
                        script="$PLUGIN_DIR/volume.sh" \
           --subscribe volume volume_change            \
