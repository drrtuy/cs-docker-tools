#!/bin/sh

gdb /usr/local/mariadb/columnstore/mysql//bin/mysqld --tui -p $(pgrep -f '/usr/local/mariadb/columnstore/mysql//bin/mysqld --basedir')
