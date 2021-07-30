#! /usr/bin/env sh

# CMD
DMENU="dmenu -i" # -i case insensity
LOCKSCREEN="betterlockscreen -l"
POWEROFF="systemctl poweroff"
REBOOT="systemctl reboot"

# options
declare -a options=(
  "Lock"
  "Logout"
  "Reboot"
  "Poweroff"
  "Quit"
)

# look up what managers are used (makes it more dynamic)
declare -a MANAGERS
  while IFS= read -r manager
  do
    MANAGERS+=("${manager,,}")
  done < <(grep 'Name' /usr/share/xsessions/*.desktop | awk -F"=" '{print $2}')


choice=$(printf "%s\n" "${options[@]}"| $DMENU -p "Exit menu:")

case "$choice" in
  'Poweroff')
    if [ $(echo -e 'No\nYes' | $DMENU -p "${choice}?" ) == "Yes" ]; then
      $POWEROFF
    fi
    ;;
  'Reboot')
    if [ $(echo -e 'No\nYes' | $DMENU -p "${choice}?") == "Yes" ]; then
      $REBOOT
    fi
    ;;
  'Lock')
    $LOCKSCREEN
    ;;
  'Logout')
    if [ $(echo -e 'No\nYes' | $DMENU -p "${choice}?") == "Yes" ]; then
      for manager in "${MANAGERS[@]}"; do 
        killall "${manager}"
      done
    fi
    ;;
  'Quit')
    exit 1
    ;;
esac
