#!/bin/sh

gdb /usr/bin/mariadbd -p $(pidof mariadbd)
