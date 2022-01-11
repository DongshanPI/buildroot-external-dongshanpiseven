#!/bin/sh -e

echo "start myir HMI 2.0..."
echo  82 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio82/direction
echo 1 > /sys/class/gpio/gpio82/value

echo  139 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio139/direction
echo 1 > /sys/class/gpio/gpio139/value


export QT_QPA_EGLFS_ALWAYS_SET_MODE="1"
export QT_QPA_EGLFS_KMS_ATOMIC='1'
export QT_QPA_EGLFS_KMS_CONFIG='/usr/share/qt5/cursor.json'

mount /dev/mmcblk2p2 /boot
export QT_QPA_PLATFORM='eglfs'
/usr/bin/mxapp2  -platform eglfs &

#export QT_QPA_PLATFORM='linuxfb'
#/usr/bin/mxapp2 -platform linuxfb &

exit 0
