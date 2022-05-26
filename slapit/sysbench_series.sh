#!/bin/bash

script=$1
schema=$2
pass=$3

for i in $(seq 1 50); do
    if [ -z "pass" ] ; then
        res_string=$(sysbench ${script} --mysql-db=$schema --mysql-user=root --time=600 --skip_trx --events=$((${i}*10)) --threads=${i} run | grep 'avg:')
    else
        res_string=$(sysbench ${script} --mysql-db=$schema --mysql-user=root --mysql-password=${pass} --time=600 --skip_trx --events=$((${i}*10)) --threads=${i} run | grep 'avg:')
    fi 
    echo "$i $res_string"
done
