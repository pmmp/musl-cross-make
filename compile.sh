#!/usr/bin/env bash

TARGET="aarch64-linux-musl"
OUTPUT="/opt/cross/"

# Fix for possible inconsistencies of CPU instructions set, optimize for size
CFLAGS="-march=x86-64 -Os"
CXXFLAGS="$CFLAGS"

cp config.mak.dist config.mak

echo "OUTPUT = $OUTPUT" >> config.mak
echo "COMMON_CONFIG += CFLAGS=\"$CFLAGS\" CXXFLAGS=\"$CXXFLAGS\"" >> config.mak

# Compile TARGET and install
make
sudo make install

# Compress TARGET
sudo tar -cJf "$TARGET.tar.xz" -C "$OUTPUT" .
