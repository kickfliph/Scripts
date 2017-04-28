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
# Created on: March 03, 2017 - Harold Luzardo
#
#===================================================
import os
import sys
import time
import datetime
import fnmatch


ts = time.time ()
st = datetime.datetime.fromtimestamp (ts).strftime ('%m-%d-%Y %H:%M:%S')
os.system ("""echo "%(timestamp)s" > /var/log/git-scripts-deploy.log"""%{'timestamp':st})
directory_to_check = "/opt/boss/" # Which directory do you want to start with?


def my_function (directory):

      print ("Listing: " + directory)
                                                                                                             #print("\t-" + "\n\t-".join(os.listdir("."))) # List current working directory
directories = [os.path.abspath(x[0]) for x in os.walk(directory_to_check)]                                   #Get all the subdirectories of directory_to_check recursively and store them in a list:
directories.remove (os.path.abspath(directory_to_check))                                                     #If you don't want your main directory included
sys.stdout = open ("/var/log/search_deploy.log", "a")

for i in directories:

      os.chdir (i)                                                                                           # Change working Directory
      for file in os.listdir ('.'):
        if fnmatch.fnmatch (file, 'deploy.py'):
          print "deploy.py"
          os.system ("sudo python deploy.py")

      my_function (i)
