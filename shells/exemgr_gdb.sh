#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/ExeMgr --tui -p $(pgrep -f ExeMgr)
