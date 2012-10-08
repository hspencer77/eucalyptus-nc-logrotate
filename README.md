eucalyptus-nc-logrotate
=======================

Alternative Log Rotation Setup for eucalyptus-nc process using cron and logrotate.

## Installation

On the machine that is running the eucalyptus-nc process, install the following files:

* place nc-log-rotate.sh in the /usr/share/eucalyptus/ directory
* place euca-nc in the /etc/logrotate.d/ directory
* edit cron (i.e. crontab -e) to run nc-log-rotate.sh every five minutes:

<code>
*/5 * * * * /bin/bash /usr/share/eucalyptus/nc-log-rotate.sh
</code>

* To make the new cronjob is loaded, restart crond (i.e. service crond restart)

By default, the rotation will occur with the /var/log/eucalyptus/nc.log file is greater than or equal to 29 M. Upon rotation, it zeros out /var/log/eucalyptus/nc.log file. This is done to keep the embedded Eucalyptus log rotation process from being kicked off when the file hits 32 M.  
