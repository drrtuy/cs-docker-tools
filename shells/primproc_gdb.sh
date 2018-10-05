#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/PrimProc --tui -p $(pidof PrimProc)
