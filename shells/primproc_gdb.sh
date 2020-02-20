#!/bin/sh

gdb /usr/bin/PrimProc --tui -p $(pidof PrimProc)
