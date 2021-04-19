#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/ProcMgr  -p $(pgrep -f ProcMgr)
