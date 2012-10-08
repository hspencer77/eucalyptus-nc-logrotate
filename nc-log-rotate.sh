#!/usr/bin/env bash

# LOG_ROTATION_SIZE needs to be equal to or less than 30000k in order to kick in
# log rotation to keep the Eucalyptus NC built-in log rotation from executing.

LOG_ROTATION_SIZE=29000
NC_LOG_SIZE=`du -s ${EUCALYPTUS}/var/log/eucalyptus/nc.log | awk '{print $1}'`

if [ "${NC_LOG_SIZE}" -ge "${LOG_ROTATION_SIZE}" ] ; then
	echo "[Log Rotation Executing] Size of nc.log file: ${NC_LOG_SIZE}" >> ${EUCALYPTUS}/var/log/eucalyptus/nc.log
        /bin/cp ${EUCALYPTUS}/var/log/eucalyptus/nc.log ${EUCALYPTUS}/var/log/eucalyptus/nc-rotate.log && cat /dev/null>${EUCALYPTUS}/var/log/eucalyptus/nc.log
	/usr/sbin/logrotate -f /etc/logrotate.d/euca-nc
fi
