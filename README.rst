
A [Rust wasm](https://rustwasm.github.io/) example with [json schema](https://json-schema.org/) and [messagepack](https://msgpack.org/index.html)
===============================================================

This project isn't finished!

Choices
-------------------------------

* I chose [MessagePack](https://msgpack.org/index.html) because it's json-compatible, and seems faster and smaller than bson (and json and yaml and other text format). It's also common.
* I chose [Json Schema](https://json-schema.org/) over protobuf and xsd. I do not find protobuf expressive enough (I like schema constraints), and while the idea of xsd is nice, the implementations I've had experience with were terrible, and I think json is a better encoding format than xml (might be [biased](https://github.com/mverleg/pyjson_tricks)).
* I didn't investigate the tools for Rust+wasm much yet, so I just chose what seemed popular.

Practical
-------------------------------

* [Setup instructions](https://rustwasm.github.io/docs/book/game-of-life/setup.html)
