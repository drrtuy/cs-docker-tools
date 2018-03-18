#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/DDLProc --tui -p $(pgrep -f DDLProc)
