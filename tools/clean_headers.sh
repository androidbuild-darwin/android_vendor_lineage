#!/bin/bash
set -eu

export ANDROID_BUILD_TOP="$PWD"

# The bundled Python crashes when it loads the Darwin libclang.
python=python3
if [[ "$OSTYPE" == darwin* ]]; then
    python=/usr/bin/python3
fi

"$python" bionic/libc/kernel/tools/clean_header.py -u \
    "$1/usr/include/asm/signal.h" \
    "$1/usr/include/asm-generic/signal.h"
