#!/usr/bin/py
# -*- coding: utf-8 -*-
#===================================================
#
# The daemon of the daemon :-]
#
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 3 of the License, or (at your option) any later
# version.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License along with
# this PACKAGE (see COPYING); if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# Created on: April 20, 2017 - Harold Luzardo
#
#===================================================
import os
import sys
import time
import datetime
import fnmatch

os.system("ps -ef | grep -v grep | grep daemon.php | wc -l > /home/msprecovery/Public/temp_daemon.log")
stats = open('/home/msprecovery/Public/temp_daemon.log', 'r').read()

if int(stats) == 0:
     os.system("ssmtp -vvv hluzardo@msprecovery.com < /opt/boss/php_daemon/alet.txt")
     os.system("ssmtp -vvv jsantana@msprecovery.com < /opt/boss/php_daemon/alet.txt")
     os.system("sudo php /opt/boss/php_daemon/daemon.php")
     os.system("rm /home/msprecovery/Public/temp_daemon.log")
else:
     os.system("rm /home/msprecovery/Public/temp_daemon.log")
