#!/bin/bash

# This script allows to gracefully start MariaDB Columnstore.
# Together with SKIP_OAM_INIT=1.

LOG_SUBPREFIX=/var/log/mariadb/columnstore
LOG_PREFIX=$LOG_SUBPREFIX/columnstore
MCS_INSTALL_PATH=/var/lib/columnstore
MCS_INSTALL_BIN=/usr/bin
PROGS='load_brm workernode controllernode PrimProc ExeMgr DMLProc DDLProc WriteEngineServer'

for i in $PROGS ; do
	if [ ! -x $MCS_INSTALL_BIN/$i ] ; then
		echo $i doesn\'t exist
		exit 1
	fi
done

echo Starting...

if [ -f $MCS_INSTALL_PATH/data1/systemFiles/dbrm/BRM_saves_current ] ; then
   echo loading BRM from $MCS_INSTALL_PATH/data1/systemFiles/dbrm/`cat $MCS_INSTALL_PATH/data1/systemFiles/dbrm/BRM_saves_current`
   $MCS_INSTALL_BIN/load_brm $MCS_INSTALL_PATH/data1/systemFiles/dbrm/`cat $MCS_INSTALL_PATH/data1/systemFiles/dbrm/BRM_saves_current`
fi

export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so 

touch $LOG_PREFIX/workernode.log && chmod 666 $LOG_PREFIX/workernode.log
$MCS_INSTALL_BIN/workernode DBRM_Worker1 &> $LOG_PREFIX/workernode.log &
echo workernode PID = $!
touch $LOG_PREFIX/controllernode.log && chmod 666 $LOG_PREFIX/controllernode.log
$MCS_INSTALL_BIN/controllernode &> $LOG_PREFIX/controllernode.log &
echo controllernode PID = $!
touch $LOG_PREFIX/primproc.log && chmod 666 $LOG_PREFIX/primproc.log
$MCS_INSTALL_BIN/PrimProc &> $LOG_PREFIX/primproc.log &
echo PrimProc PID = $!
sleep 1
touch $LOG_PREFIX/exemgr.log && chmod 666 $LOG_PREFIX/exemgr.log
$MCS_INSTALL_BIN/ExeMgr &> $LOG_PREFIX/exemgr.log &
echo ExeMgr PID = $!
touch $LOG_PREFIX/writeengineserver.log && chmod 666 $LOG_PREFIX/writeengineserver.log
$MCS_INSTALL_BIN/WriteEngineServer &> $LOG_PREFIX/writeengineserver.log &
echo WriteEngineServer PID = $!
sleep 2
touch $LOG_PREFIX/dmlproc.log && chmod 666 $LOG_PREFIX/dmlproc.log
$MCS_INSTALL_BIN/DMLProc &> $LOG_PREFIX/dmlproc.log &
echo DMLProc PID = $!
touch $LOG_PREFIX/ddlproc.log && chmod 666 $LOG_PREFIX/ddlproc.log
$MCS_INSTALL_BIN/DDLProc &> $LOG_PREFIX/ddlproc.log &
echo DDLProc PID = $!

exit 0
