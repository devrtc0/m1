#!/usr/bin/env sh

if [ ! -d "/sys/class/gpio/gpio123" ]; then
        echo "Exporting GPIO123"
        echo 123 > /sys/class/gpio/export
fi
DIRECTION=$(cat /sys/class/gpio/gpio123/direction)
if [ "out" != "$DIRECTION" ]; then
        echo "Setting GPIO123 out"
        echo out > /sys/class/gpio/gpio123/direction
fi

echo 1 > /sys/class/gpio/gpio123/value
sleep 0.5
echo 0 > /sys/class/gpio/gpio123/value
