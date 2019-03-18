FROM archlinux/base
RUN pacman -Sy --noconfirm bazel gcc tar python
COPY . /build
WORKDIR /build
RUN bazel build --config=musl //:iso
