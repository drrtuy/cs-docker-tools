#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/ProcMon  -p $(pgrep -f '^/usr/local/mariadb/columnstore/bin/ProcMon')
