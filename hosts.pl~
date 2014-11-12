#!/usr/bin/perl
# -*- coding: utf-8 -*-
#===================================================
# 
# Introduce nuevos hosts a: /etc/hosts
#
# Copyleft (C) 2013  harold Luzardo <haroldburtonl@gmial.com>
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
# Created on: May 21, 2013 - Harold Luzardo
#
#===================================================

use strict;
use warnings;

# VARIABLES 
my $SrvKepeincv = "172.16.2.234 kepein.cafevenezuela.gob.ve";
my $SrvKepeinadm13 = "172.16.2.234 www.cvc.gob.ve/kepeinadmon";
my $SrvKepeinadm = "172.16.2.91 kepeinadmon.cafevenezuela.gob.ve";
my $SrvKepeincreo = "200.35.110.227 correo.cafevenezuela.gob.ve";
my $placed = "/etc/hosts";
# INICIALIZACION
print "...:::Binevenido al Sistema inclusion de nuvos hosts de Café Venezuela:::..\n";
print "Inicializando la inclusión.....\n";
system ("echo $SrvKepeincv >> $placed");
system ("echo $SrvKepeinadm13 >> $placed");
system ("echo $SrvKepeinadm >> $placed");
system ("echo $SrvKepeincreo >> $placed");
print "...::Hasta luego::..\n";

exit;
