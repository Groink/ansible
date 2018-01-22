#!/bin/bash
(
echo d
echo 2
echo n
echo e
echo 2
echo
echo
echo n
echo
echo
echo t
echo 5
echo 8e
echo w
) | fdisk /dev/sda

partprobe -s
pvresize /dev/sda5
lvextend -l 100%VG /dev/mapper/ubuntu16--template--vg-root
resize2fs /dev/mapper/ubuntu16--template--vg-root
vgrename ubuntu16-template-vg $HOSTNAME-vg
