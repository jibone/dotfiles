#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

# sketchybar --set $NAME background.drawing=$SELECTED

source "$CONFIG_DIR/colors.sh"

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on          \
                         background.color=$ACCENT_COLOR \
                         label.color=$BAR_COLOR         \
                         icon.color=$BAR_COLOR
else
  sketchybar --set $NAME background.color=off      \
                         label.color=$ACCENT_COLOR \
                         icon.color=$ACCENT_COLOR
fi


mouse_clicked() {
  if [ "$BUTTON" = "left" ]; then
    typeset -A desktophash
    desktophash[0]=29
    desktophash[1]=18
    desktophash[2]=19
    desktophash[3]=20
    desktophash[4]=21
    desktophash[5]=23
    desktophash[6]=22
    desktophash[7]=26
    desktophash[8]=28
    desktophash[9]=25
    desktopkey=${desktophash[$SID]}
    osascript -e "tell application \"System Events\" to key code $desktopkey using control down"
    #switchdesktop $SID
  fi
}

switchdesktop() {
    typeset -A desktophash
    desktophash[0]=29
    desktophash[1]=18
    desktophash[2]=19
    desktophash[3]=20
    desktophash[4]=21
    desktophash[5]=23
    desktophash[6]=22
    desktophash[7]=26
    desktophash[8]=28
    desktophash[9]=25
    desktopkey=${desktophash[$1]}
    osascript -e "tell application \"System Events\" to key code $desktopkey using control down"
}
