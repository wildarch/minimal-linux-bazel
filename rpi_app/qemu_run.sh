#!/bin/sh

bazel build --config=rpi2 @raspberrypi_firmware//:rpi2-qemu-files //:rootfs &&
qemu-system-arm \
    -M raspi2 \
    -dtb bazel-genfiles/external/raspberrypi_firmware/rpi2.dtb \
    -kernel bazel-genfiles/external/raspberrypi_firmware/kernel7.img \
    -m 256 \
    -serial stdio \
    -append console=tty1 \
    -initrd bazel-bin/initrd.gz \
