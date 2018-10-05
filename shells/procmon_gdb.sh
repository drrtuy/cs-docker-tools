#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/ProcMon --tui -p $(pgrep -f '^/usr/local/mariadb/columnstore/bin/ProcMon')
