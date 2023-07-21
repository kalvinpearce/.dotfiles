#!/bin/bash

battery=$(headsetcontrol -bc 2>/dev/null)

if [ $? -eq 0 ]; then
  TEXT="$battery%"
  CLASS=normal

  # if battery is less than 20%, class is warning
  if [ $battery -lt 20 ]; then
    CLASS=warning
  fi

  # if battery is -1, it's charging
  if [ $battery -eq -1 ]; then
    TEXT=""
    CLASS=charging
  fi
else
  TEXT=""
  CLASS=disconnected
fi

printf '{"text": "%s", "class": "%s"}\n' "$TEXT" "$CLASS"
