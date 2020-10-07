#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/WriteEngineServ -p $(pgrep -f WriteEngineServ)
