#!/bin/bash

concurrency=$1
number=$2
iterations=$3
slapit=$4
schema=$5

mysqlslap -u root --concurrency $concurrency --number-of-queries $number --iterations $iterations --query $slapit --create-schema=$5 #--init-command 'select count(*) from flights;'

