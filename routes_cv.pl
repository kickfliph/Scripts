#!/usr/bin/perl
# -*- coding: utf-8 -*-
#===================================================
# 
# crear las rutas de todas la sedes de Café Venezuela y la Coorporación del Café
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
# Created on: Feb 25, 2012 - Harold Luzardo
#
#===================================================

use strict;
use warnings;

# INICIALIZACION
print "...:::Binevenido al script de Rutas del Café Venzuela:::..\n";
system ("route add -net 172.18.1.0 netmask 255.255.255.0 gw 172.18.2.254");
system ("route add -net 172.18.3.0 netmask 255.255.255.0 gw 172.18.2.254");
system ("route add -net 172.18.4.0 netmask 255.255.255.0 gw 172.18.2.254");
system ("route add -net 172.18.5.0 netmask 255.255.255.0 gw 172.18.2.254");
system ("route add -net 172.18.6.0 netmask 255.255.255.0 gw 172.18.2.254");
print "...:::Hasta luego:::..\n";
