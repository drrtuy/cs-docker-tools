#!/bin/sh

gdb /usr/local/mariadb/columnstore/bin/controllernode  -p $(pgrep -f /usr/local/mariadb/columnstore/bin/controllernode)
