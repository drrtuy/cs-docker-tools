#!/bin/sh

gdb /usr/bin/mysqld --tui -p $(pidof mysqld)
