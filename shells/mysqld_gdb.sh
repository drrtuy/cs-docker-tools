#!/bin/sh

gdb /usr/local/mariadb/columnstore/mysql//bin/mysqld --tui -p $(pidof mysqld)
