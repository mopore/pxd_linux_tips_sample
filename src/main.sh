#!/bin/bash

if ping -c 1 -w 2 other-machine > /dev/null ; then
    python3 ./calling.py
else
    echo "We have a problem"
fi

exit 0
