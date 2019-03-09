genrule(
    name = "rust_hello_cargo",
    srcs = glob(["src/**/*.rs"]) + [
        "Cargo.toml",
        "Cargo.lock",
    ],
    outs = ["rust_hello"],
    cmd = "cargo build \
		    --manifest-path $(location Cargo.toml) \
		    --release \
		    --target x86_64-unknown-linux-musl \
		    --target-dir . \
		&& cp x86_64-unknown-linux-musl/release/rust_hello $@",
    visibility = ["//visibility:public"],
)
