#!/bin/sh

gdb /usr/bin/DMLProc -p $(pgrep -f DMLProc)
