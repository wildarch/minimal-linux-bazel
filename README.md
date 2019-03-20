# Minimal linux image using bazel (with Rust)
This is all very experimental and documentation is basically non-existent. Hopefully that will change one day...

# Building
Only linux systems are supported as hosts for now.

You need the following dependencies:
* Bazel
* Python interpreter
* (optional) qemu to run the generated disk image.

To build a bootable iso image (for x86-64 qemu):
```bash
bazel build --config=musl //application:iso
```

To run in qemu:
```bash
./qemu_run.sh
```
