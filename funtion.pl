#!/usr/bin/perl
# -*- coding: utf-8 -*-
#===================================================
# 
# strech_respaldo: extrae la fecha de ayer y seleciona compra con la fecha actual y respalda lo seleccionado.
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
# Created on: Feb 02, 2012 - Harold Luzardo
#
#===================================================
use strict;
use warnings;
use POSIX qw(strftime);
 
#variables
my $BackupServer = 192.168.10.72;
my $BackupSource = "/var/lib/vz/dump/";
my $BackupDestiny = ":/VirtualsMachines";
my @T = localtime(time-86400);
my $fecha_ayer = sprintf("%04d_%02d_%02d",($T[5]+1900),$T[4]+1,$T[3]%100);
my $fecha_hoy = strftime("%Y_%m_%d", localtime);
my $dir ="/var/lib/vz/dump";
my $ext =".tgz";


print "...:::Binevenido al Sistema de Respaldo CVACAfÉ:::..\n";

opendir(DIR, "$dir") || die;
while(my $lista = readdir(DIR)){
	next unless 
	(my $tmp_fecha) = $lista =~ m/$fecha_ayer/; 
	(my $tmp_ext) = $lista =~ m/$ext/; 
	if ($tmp_fecha and $tmp_ext){
	my $copydump = system ("scp $BackupSource$lista $BackupServer$BackupDestiny");
	print "$lista\n";
	}
}
closedir(DIR);
print "...::Hasta luego::..\n";
exit;
