genrule(
    name = "rust_hello_cargo",
    srcs = glob(["src/**/*.rs"]) + [
        "Cargo.toml",
        "Cargo.lock",
        ":deps",
    ],
    outs = ["rust_hello"],
    cmd = "tar xf $(location :deps) && \
		cargo build \
		    --manifest-path $(location Cargo.toml) \
		    --release \
		    --target x86_64-unknown-linux-musl \
		    --target-dir target/ \
		&& cp target/x86_64-unknown-linux-musl/release/rust_hello $@",
    executable = True,
    local = True,
    output_to_bindir = True,
    visibility = ["//visibility:public"],
)

genrule(
    name = "deps",
    srcs = [
        "Cargo.toml",
        "Cargo.lock",
    ],
    outs = ["target.tar"],
    cmd = "cp $(location Cargo.toml) . && \
		cp $(location Cargo.lock) . && \
		mkdir -p src/bin target/ && \
		echo \"fn main() {}\" > src/bin/bogus.rs && \
		cargo build \
		    --bin bogus \
		    --release \
		    --target x86_64-unknown-linux-musl \
		    --target-dir target/ && \
		tar cf $@ target/",
)
