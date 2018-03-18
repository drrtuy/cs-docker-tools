#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/DMLProc --tui -p $(pgrep -f DDLProc)
