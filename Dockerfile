FROM archlinux/base
RUN pacman -Sy --noconfirm bazel gcc tar python
COPY . /build
WORKDIR /build
RUN bazel fetch //application:iso
RUN bazel build --config=musl //application
RUN bazel build --config=musl //application:iso
