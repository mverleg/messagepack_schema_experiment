
# This is a popular image that claims to fix a number of issues in vanilla Docker Ubuntu
# https://phusion.github.io/baseimage-docker/
FROM phusion/baseimage:0.11
CMD ["/sbin/my_init"]

WORKDIR /tmp

# General utils
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install git-core curl build-essential openssl libssl-dev ca-certificates gcc

# Npm
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs npm
RUN npm install npm@latest -g

# Rust
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/cargo \
    PATH=/cargo/bin:$PATH \
    RUST_VERSION=nightly-2020-01-06
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o install_rustup.sh && \
    sh install_rustup.sh -y --default-toolchain "$RUST_VERSION" --profile minimal && \
    rm -f install_rustup.sh
RUN rustup component add clippy
RUN rustup component add rustfmt
RUN cargo install cargo-generate

# Wasm


#TODO @mark: --mount=type=cache,target=/root/.cargo  https://stackoverflow.com/a/55122453/723090

WORKDIR /code


