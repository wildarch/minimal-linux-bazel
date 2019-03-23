load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def fetch_packages():
    http_archive(
        name = "pycdlib",
        build_file_content = """ 
py_library(
    name = "pycdlib",
    srcs = glob(["*.py"]),
    visibility = ["//visibility:public"],
)
        """,
        sha256 = "8a1669c8e932412b4572f5331d31f8ec2e70b63478eee50bae6448ec096acf6b",
        strip_prefix = "pycdlib-1.7.0/pycdlib/",
        url = "https://github.com/clalancette/pycdlib/archive/v1.7.0.tar.gz",
    )
