#!/bin/bash

concurrency=$1
number=$2
script=$3
schema=$4
pass=$5

if [ -z "$pass" ] ; then
    sysbench $script --mysql-db=$schema --mysql-user=root --skip_trx --events=$number --threads=$concurrency --histogram --report-interval=2 --time=600 run
else
    sysbench $script --mysql-db=$schema --mysql-user=root --mysql-password=${pass} --skip_trx --events=$number --threads=$concurrency --histogram --time=600 run
fi 

