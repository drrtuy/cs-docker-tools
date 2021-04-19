#!/bin/sh

gdb /usr/bin/workernode  -p $(pgrep -f /usr/bin/workernode)
