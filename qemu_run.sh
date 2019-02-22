bazel build //:iso
qemu-system-x86_64 -m 128M -cdrom bazel-genfiles/dist.iso -boot d -nographic
