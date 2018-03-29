#!/bin/sh

sudo docker exec -ti -e COLUMNS=$(tput cols) -e LINES=$(tput lines) --privileged $1 bash
