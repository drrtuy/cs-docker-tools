#!/bin/sh

gdb /usr/bin/workernode --tui -p $(pgrep -f /usr/bin/workernode)
