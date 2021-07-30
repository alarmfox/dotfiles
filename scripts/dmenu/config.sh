#! /usr/bin/env sh

EDITOR="vim"
DMENU="dmenu -i -l 10"
CONFIG_DIR="$HOME/.config"
TERMINAL="alacritty"

declare -a options=(
  "alacritty $CONFIG_DIR/alacritty/alacritty.yml"
  "bash $HOME/.bashrc"
  "bash-profile $HOME/.bash_profile"
  "bspwm $CONFIG_DIR/bspwm/bspwmrc"
  "picom $CONFIG_DIR/picom/picom.conf"
  "polybar $CONFIG_DIR/polybar/config"
  "polybar-launch $CONFIG_DIR/polybar/launch.sh"
  "sxhkd $CONFIG_DIR/sxhkd/sxhkdrc" 
  "zathura $CONFIG_DIR/zathura/zathurarc"
  "quit"
)

choice=$(printf "%s\n" "${options[@]}" | $DMENU -p "Edit config:")

if [ "$choice" == "quit" -o -z "$choice" ];
then
  exit 1
fi

path=$(echo "$choice" | awk {'print $2'})

$TERMINAL -e $EDITOR $path
