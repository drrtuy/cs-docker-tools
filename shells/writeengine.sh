#!/bin/sh

gdb /usr/bin/WriteEngineServer -p $(pgrep -f WriteEngineServ)
