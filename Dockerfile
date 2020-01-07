
FROM alpine:3.11.2

WORKDIR /tmp

# General utils
RUN apk add --update curl && rm -rf /var/cache/apk/*

# Npm
RUN apk add --update nodejs nodejs-npm && rm -rf /var/cache/apk/*
RUN npm install npm@latest -g

# Rust
RUN apk add --no-cache ca-certificates gcc && rm -rf /var/cache/apk/*
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


