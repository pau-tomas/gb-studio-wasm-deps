#!/bin/bash

set -eu

if [[ "$(which emsdk)" == "" ]]; then
    echo "I need emscripten sdk active, see https://emscripten.org/docs/getting_started/downloads.html"
    exit 1
fi

cd binjgb

! rm -rf out
! mkdir -p out
cd out

cmake -E env LDFLAGS='' \
    cmake \
        -DCMAKE_TOOLCHAIN_FILE=${EMSDK}/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DWERROR=ON \
        -DWASM=true \
        -DGBSTUDIO=ON \
        ../
make

cd ../..
mkdir -p build/wasm/binjgb
mv binjgb/out/binjgb* build/wasm/binjgb