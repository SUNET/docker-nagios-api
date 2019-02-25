#!/bin/bash

if [ $# -eq 0 ]; then
   nagios-api -p 8080 -c /var/lib/nagios3/rw/nagios.cmd -s /var/cache/nagios3/status.dat -l /var/log/nagios3/nagios.lg
else
   exec $*
fi
