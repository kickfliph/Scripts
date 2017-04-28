#!/usr/bin/py
# -*- coding: utf-8 -*-
#===================================================
#
# Simple deploy of a git repository
#
# Copyleft (C) 2017  harold Luzardo <haroldburtonl@gmial.com>
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
# Created on: Feb 03, 2017 - Harold Luzardo
#
#===================================================
import os
import sys
import time
import datetime

ts = time.time()
st = datetime.datetime.fromtimestamp(ts).strftime('%m-%d-%Y %H:%M:%S')

os.system("""echo "%(timestamp)s" > deploy.log"""%{'timestamp':st})
os.system ("sudo -Hu www-data git stash")
os.system ("sudo -Hu www-data git pull origin master >> deploy.log")
