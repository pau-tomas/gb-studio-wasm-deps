
# GB Studio's WebAssembly dependencies

Helper repository with the external WebAssembly dependencies for [GB Studio](https://github.com/chrismaltby/gb-studio). 

Format and build scripts pretty much based on [rgbds-live](https://github.com/gbdev/rgbds-live/).

## Dependencies
[Binjgb](https://github.com/binji/binjgb): Embedded emulator in GB Studio and also used in web exports and, in the background, to play previews of music and sound effects. 

[RGBDS](https://rgbds.gbdev.io/): Used to compile the songs and sound effects into a rom used for preview. Currently using version 0.6.1 patched with the contents of `rgbds.patch` on build.

## Build

```
./build-binjgb.sh
./build-rgbds.sh
```

Use the files from `build/wasm` to replace the ones in GB Studio's `appData/wasm/binjgb` and `appData/wasm/rgbds` folders.


