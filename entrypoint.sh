#!/bin/bash

#/usr/sbin/sshd &

# Start Xvfb in the background
Xvfb :1 -screen 0 1024x768x16 &

# Give Xvfb some time to start
sleep 2

# Launch kitty and x11vnc within the virtual display
DISPLAY=:1 kitty &
DISPLAY=:1 x11vnc -display :1 -forever -usepw
