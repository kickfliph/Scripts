#!/usr/bin/perl
# -*- coding: utf-8 -*-
#===================================================
# 
# Backup.pl   -- sencillo script en perl, modifica la hora.  
#
# Copyleft (C) 2012  harold Luzardo <haroldburtonl@gmial.com>
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
# Created on: Enero 15, 2013 - Harold Luzardo
#
#===================================================

use strict;
use warnings;
use POSIX qw(strftime);

my $anno_hoy = strftime("%Y", localtime);
my $fecha_hora_hoy = strftime("%m%d%H%M", localtime);
my $fecha_hora_anno_hoy = strftime("%a %b %e %H:%M:%S %Y", localtime);

print "...:::Fecha Actual $fecha_hora_anno_hoy:::...\n";
 if (2013  == $anno_hoy){
	my $anno_ayer = 2012;	
	system ("date $fecha_hora_hoy$anno_ayer");
	}

print "...:::Cambio la fecha exitosamente:::...\n"; 
system "date";
