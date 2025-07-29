#!/bin/bash
# E530

bl_dev=/sys/class/backlight/intel_backlight
bl_step=300
bl_max=4882
bl_min=300

min() {
  echo $(($1<$2?$1:$2))
}

max() {
  echo $(($1>$2?$1:$2))
}

case "$1" in
  video/brightnessup)
    echo $(min $(($(< $bl_dev/brightness) + $bl_step)) $bl_max) >$bl_dev/brightness
    ;;
  video/brightnessdown)
    echo $(max $(($(< $bl_dev/brightness) - $bl_step)) $bl_min) >$bl_dev/brightness
    ;;
  button/power)
    case "$2" in
      PBTN|PWRF)
        echo -n mem >/sys/power/state
        ;;
    esac
    ;;
  button/sleep)
    case "$2" in
      SLPB|SBTN)
        echo -n mem >/sys/power/state
        ;;
    esac
    ;;
  ac_adapter)
    case "$2" in
      AC|ACAD|ADP0|ACPI*)
        case "$4" in
          00000000)
            #echo 'AC unplugged'
            ;;
          00000001)
            #echo 'AC plugged'
            ;;
        esac
        ;;
    esac
    ;;
  button/lid)
    case "$3" in
      close)
        #echo 'LID closed'
        if [ $(cat /sys/class/power_supply/AC/online) = "0" ]; then
          echo -n mem >/sys/power/state
        fi
        ;;
      open)
        #echo 'LID opened'
        ;;
  esac
  ;;
  *)
    #echo "ACPI group/action undefined: $1 / $2"
    ;;
esac

# vim:set ts=2 sw=2 ft=sh et:
