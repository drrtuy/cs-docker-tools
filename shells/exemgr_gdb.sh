#!/bin/sh

gdb /usr/bin/ExeMgr --tui -p $(pidof ExeMgr)
