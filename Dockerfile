FROM archlinux/base
RUN pacman -Sy --noconfirm bazel gcc tar python
COPY . /build
WORKDIR /build/pc_app
RUN bazel build --config=x86_64 //:iso
