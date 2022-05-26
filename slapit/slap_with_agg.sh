#!/bin/bash

concurrency=$1
number=$2
iterations=$3

mysqlslap -u root --concurrency $concurrency --number-of-queries $number --iterations $iterations --query /data/slapit/slap2.sql --create-schema=bts
