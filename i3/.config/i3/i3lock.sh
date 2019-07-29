#!/bin/bash
scrot /tmp/screen.png
#<image conversion here>
exec i3lock -e -i /tmp/screen.png
