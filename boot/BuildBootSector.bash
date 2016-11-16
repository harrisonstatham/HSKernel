#!/bin/bash

function hexDump {
    od -t x1 -A n "$1.bin"
    #xxd "$1.bin"
}


function main {

    QEMU="/usr/local/Cellar/qemu/2.7.0/bin"


    echo ""
    echo "=============================================================="
    echo "Welcome to the Build Script for HSKernel Boot Sectors"
    echo ""
    echo "=============================================================="

    echo "1. Starting build process..."

    nasm "$1.asm" -f bin -o "$1.bin"

    echo "Finished building binary."

    hexDump $1

    echo ""
    echo "2. Running QEMU"

    $QEMU/qemu-system-x86_64 "$1.bin"

}


main $@






