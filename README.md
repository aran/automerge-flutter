# Hey. What is this

Hello internet.

This is a proof of concept of using `flutter_rust_bridge` to make a Flutter app that uses `automerge` (specifically, `autosurgeon`).

https://cjycode.com/flutter_rust_bridge/

https://github.com/automerge/autosurgeon

It uses a websocket (wsserver) server to relay messages between clients. Every client joining resets all the others.

It works on web and iOS simulator, on my machine. Subtle details of XCode project set up matter. Machine configuration, such as globally-installed `rustup` toolchains and targets, also matter.

The rust module is called `radd`. That's short for "rust add" because the first thing I did was make a function for doing 2+2 in rust. The flutter project is called "flutters".

The flutter_rust_bridge_codegen includes a misleading bit for a macos header, but macos support isn't actually set up.

## On rust changes

    cd flutters
    flutter_rust_bridge_codegen --rust-input radd/src/api.rs --dart-output lib/bridge_generated.dart --c-output ios/Runner/bridge_generated.h --extra-c-output-path macos/Runner --dart-decl-output lib/bridge_definitions.dart --wasm

## Websocket server (wsserver):

    cd wsserver
    dart pub get
    dart run


## Flutter with rust (flutters):


### Web / WASM:

    cd flutters
    flutter pub get
    dart run flutter_rust_bridge:serve --crate radd

### iOS
Just use Flutter's Debug in iOS simulator