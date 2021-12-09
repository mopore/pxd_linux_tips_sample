#!/bin/bash

if ping -c 1 -w2 jni-quieter2 > /dev/null ; then
    python3 ./calling.py
else
    echo "We have a problem"
fi

exit 0