#!/usr/bin/env bash

# bash retardation to get path to the directory this script exists in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; 
# start working from project root
cd "$SCRIPT_DIR/../../"

BUILD_FLAGS=()
BUILD_FLAGS+=(-DTRACY_ENABLE)

# NOTE: building with this disables tracy's zone validation. Improves 
# performance, but you must be sure that you use tracy zones (begin and end) 
# correctly.
# BUILD_FLAGS+=(-DTRACY_NO_VERIFY=ON) 
BUILD_FLAGS+=(-DTRACY_MANUAL_LIFETIME=ON)
BUILD_FLAGS+=(-DTRACY_DELAYED_INIT=ON)
c++ -std=c++11 "${BUILD_FLAGS[@]}" -O2 vendor/tracy/public/TracyClient.cpp -shared -fPIC -o tracy.so
