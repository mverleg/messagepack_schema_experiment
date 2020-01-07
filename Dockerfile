
FROM alpine:3.11.2

WORKDIR /tmp

# npm
RUN apk add --update nodejs nodejs-npm

# rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# wasm


#TODO @mark: --mount=type=cache,target=/root/.cargo  https://stackoverflow.com/a/55122453/723090

WORKDIR /code


