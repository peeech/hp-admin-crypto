# Contributing

Client is built in `Rust 1.38.0-nightly` and compiled to WASM using `wasm-pack` tools.

## Setup
`nix-shell` sets the environment for development and tests. Type `nix-shell` from project's root directory to set up dev environment, then cd to `client` folder.

## Build
Build from source with `wasm-pack build`.

## Tests
Tests are divided into 2 groups - Rust unit tests and Wasm-pack unit tests.

### Rust unit tests
Mostly check for breaking changes from dependencies:
```
cargo test
```

### Wasm-pack unit tests
Test interaction with created Wasm package in selected environments:
```
wasm-pack --firefox
```
Must specify at least one of `--node`, `--chrome`, `--firefox`, or `--safari`.

### WWW playground
You can interact with package via browser's console by going to `/tests/www` and running:
```
npm install
npm run start
```
This will spin up a webpack hot reload server.

## Publish
```
wasm-pack publish
```