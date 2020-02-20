#!/bin/bash

# This script gracefully stops MariaDB Columnstore
# to be used with SKIP_OAM_INIT=1

PROGS='workernode controllernode PrimProc ExeMgr DMLProc DDLProc mysqld WriteEngineServer'

MCS_INSTALL_DIR=/usr

$MCS_INSTALL_DIR/bin/save_brm

echo Sending SIGTERM
kill $(pidof $PROGS) > /dev/null
sleep 3
echo Sending SIGKILL
kill -9 $(pidof $PROGS) > /dev/null

echo Clearing SHM
$MCS_INSTALL_DIR/bin/clearShm

exit 0
