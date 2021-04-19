#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/DDLProc  -p $(pgrep -f DDLProc)
