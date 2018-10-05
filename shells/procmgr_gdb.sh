#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/ProcMgr --tui -p $(pgrep -f ProcMgr)
