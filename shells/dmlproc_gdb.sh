#!/bin/sh

gdb /usr/bin/DMLProc --tui -p $(pgrep -f DMLProc)
