#!/usr/bin/env bash

# bash retardation to get path to the directory this script exists in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; 
# start working from project root
cd "$SCRIPT_DIR/../"

BUILD_FLAGS=()
BUILD_FLAGS+=(-DCMAKE_BUILD_TYPE=Release)
BUILD_FLAGS+=(-DLEGACY=ON) # build for X11
# BUILD_FLAGS+=(-DNO_FILESELECTOR=ON) # build without file picker

# NOTE: first line sets the cache so that you can also do offline builds
CPM_SOURCE_CACHE=~/.cache/cpm \
CXX=clang++ CC=clang cmake -G Ninja -S vendor/tracy/profiler -B build/tracy-profiler "${BUILD_FLAGS[@]}"
cmake --build build/tracy-profiler
