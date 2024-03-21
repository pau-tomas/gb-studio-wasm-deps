#!/bin/bash

set -eu

if [[ "$(which emmake)" == "" ]]; then
    echo "I need emscripten sdk active, see https://emscripten.org/docs/getting_started/downloads.html"
    exit 1
fi

cd rgbds

patch -p1 < ../rgbds.patch

MAKE_ARGS="Q= PNGCFLAGS= PNGLDFLAGS= PNGLDLIBS="

CFLAGS="-O3 -sEXPORT_ES6=1 -sENVIRONMENT=web -sMODULARIZE=1 -sEXPORTED_RUNTIME_METHODS=['FS'] -sUSE_LIBPNG"

emmake make ${MAKE_ARGS} CFLAGS="${CFLAGS} -sEXPORT_NAME=createRgbAsm" rgbasm 
emmake make ${MAKE_ARGS} CFLAGS="${CFLAGS} -sEXPORT_NAME=createRgbLink" rgblink
emmake make ${MAKE_ARGS} CFLAGS="${CFLAGS} -sEXPORT_NAME=createRgbFix" rgbfix

cd ..
mkdir -p build/wasm/rgbds
mv rgbds/rgbasm build/wasm/rgbds/rgbasm.js
mv rgbds/rgblink build/wasm/rgbds/rgblink.js
mv rgbds/rgbfix build/wasm/rgbds/rgbfix.js

mv rgbds/*.wasm build/wasm/rgbds/


