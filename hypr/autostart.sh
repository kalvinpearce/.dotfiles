#!/bin/bash

# Start slack only if its a week day
if [ $(date +%u) -lt 6 ]; then
    slack &
fi

# Start spotify
spotify &

# Start thunderbird
thunderbird &
