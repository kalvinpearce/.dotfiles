#!/bin/bash

headphones_off=1

while true; do
  if headsetcontrol -bc > /dev/null 2>&1; then
    if [ $headphones_off -eq 1 ]; then
      notify-send "Headphones connected" "Disabling LED"
      headphones_off=0
      headsetcontrol -l 0 > /dev/null 2>&1
    fi
  else
    if [ $headphones_off -eq 0 ]; then
      notify-send "Headphones disconnected"
      headphones_off=1
    fi
  fi
  sleep 30
done
