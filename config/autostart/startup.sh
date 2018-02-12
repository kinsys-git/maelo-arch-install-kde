#!/bin/bash
xdotool behave_screen_edge bottom-left exec qoverview
qoverview-config-server
sudo reflector --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose
sudo modprobe atmel_mxt_ts
