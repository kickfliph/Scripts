#!/usr/bin/perl
# -*- coding: utf-8 -*-
#===================================================
# 
# Agrega un usuario al directorio LDAP de la estructura de Café Venezuela creando su carpeta y contraseña. Además el usuario es samba y UNIX.
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
# Created on: Mar 26, 2013 - Harold Luzardo
#
#===================================================

use strict;
use warnings;

#variables


print "...:::Binevenido al Script de inclusión de Usuarios al directorio LDAP:::..\n";
print "Introduzca el nombre del usuario: ";
	my $nombre = <STDIN>;
print "Introduzca el apellido del usuario: "; 
	my $apellido = <STDIN>;

	my $str = substr($nombre,0,1);
	my $usuario = $str.$apellido;
	print "$str\n"; 
	print "$usuario\n";
	my $useraddldap = smbldap-useradd -a -m -N '$nombre' -S '$apellido' -P $usuario;

system ("$useraddldap");
print "...:::Usuario $usuario fué añadido:::..\n";

#system ("smbldap-useradd -a -m -N '$nombre' -S '$apellido' -P $usuario");
