#!/bin/bash

function hexDump {
    od -t x1 -A n "bin/$1.bin"
    #xxd "$1.bin"
}

function getSize {

    stat -f%z "bin/$1.bin"
}


function main {

    QEMU="/usr/local/Cellar/qemu/2.7.0/bin"


    echo ""
    echo "=============================================================="
    echo "Welcome to the Build Script for HSKernel Boot Sectors"
    echo ""
    echo "=============================================================="

    echo "1. Starting build process..."

    nasm "asm/$1.asm" -f bin -o "bin/$1.bin"

    echo "Finished building binary."

    hexDump $1

    echo ""
    echo "2. Running QEMU"

$QEMU/qemu-system-x86_64 "bin/$1.bin"
}


main $@

#
# QEMU log items
# Potentially helpful for debugging in the future.
#
# Just add: -d <log item from below>
#
#Log items (comma separated):
#out_asm         show generated host assembly code for each compiled TB
#in_asm          show target assembly code for each compiled TB
#op              show micro ops for each compiled TB
#op_opt          show micro ops after optimization
#op_ind          show micro ops before indirect lowering
#int             show interrupts/exceptions in short format
#exec            show trace before each executed TB (lots of logs)
#cpu             show CPU registers before entering a TB (lots of logs)
#mmu             log MMU-related activities
#pcall           x86 only: show protected mode far calls/returns/exceptions
#cpu_reset       show CPU state before CPU resets
#unimp           log unimplemented functionality
#guest_errors    log when the guest OS does something invalid (eg accessing a
#non-existent register)
#page            dump pages at beginning of user mode emulation
#nochain         do not chain compiled TBs so that "exec" and "cpu" show
#complete traces
#trace:PATTERN   enable trace events



