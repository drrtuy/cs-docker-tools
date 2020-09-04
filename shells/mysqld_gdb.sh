#!/bin/sh

gdb /usr/bin/mariadbd --tui -p $(pidof mariadbd)
