#!/usr/bin/env bash

echo "beginning build process"

# find each .nim file
for i in $(find . -name "*.nim" -type f); do
    # compile and strip
    echo "compiling ${i}"
    nim c -d:release --opt:size --passL:-s --passL:-w "${i}" > /dev/null 2>&1

    # pass each resulting binary to upx
    compiledfile=$(basename "${i}" .nim)
    echo "packing ${compiledfile}"
    upx -9 "${compiledfile}" > /dev/null 2>&1
done

echo "finished build process"