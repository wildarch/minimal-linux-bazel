bazel build --config=musl //:iso && \
qemu-system-x86_64 \
    -m 128M \
    -cdrom bazel-bin/dist.iso \
    -boot d \
    -nographic \
    -netdev user,id=n1,hostfwd=tcp::3000-:3000 \
    -device e1000,netdev=n1
