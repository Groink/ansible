#!/bin/bash
(
echo d
echo 2
echo n
echo p
echo 2
echo
echo
echo t
echo 2
echo 8e
echo w
) | fdisk /dev/sda

partprobe -s
pvresize /dev/sda2
lvextend -l 100%VG /dev/mapper/cl-root
resize2fs /dev/mapper/ubuntu16--template--vg-root
vgrename ubuntu16-template-vg $HOSTNAME-vg
vgchange -ay
