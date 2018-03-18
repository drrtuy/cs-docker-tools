#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/PrimProc --tui -p $(pgrep -f PrimProc)
