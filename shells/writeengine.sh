#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/WriteEngineServ --tui -p $(pgrep -f WriteEngineServ)
