#!/usr/bin/perl
# -*- coding: utf-8 -*-
#===================================================
# 
# adduserVSFTPD   -- agregar usuarios y su carpeta en forma automática a la base de datos 
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
use DBI;

# VARIABLES MYSQL
my $database = "DBI:mysql:system";
my $tablename = "username";
my $user = "vsftpd";
my $pw = "123456";

# DATOS DEL USUARIO
print "Introduzca el nuevo usuario FTP:\n";
chomp(my $inUser = <STDIN>);
print "Introduzca la contraseña de usuario FTP $inUser:\n";
chomp(my $inPw = <STDIN>);
print "¡Su usuario fué incluido con Exito! \n";

# CONEXION PERL MYSQL 
my $dbh = DBI->connect($database, $user, $pw) || die "No se pudo conectar a la Base de datos: $DBI::errstr";

# MYSQL QUERY para insertar el usuario en la Base de Datos
my $queryInsertUser = $dbh->do("INSERT INTO $tablename (username, password) VALUES('$inUser', PASSWORD('$inPw'))");

# DESCONEXION De la Base de datos
$dbh->disconnect || warn "Hubo un fallo al desconectarse de la Base de Datos: $DBI::errstr";

# CREANDO LA CARPETA DEL USUARIO
mkdir ("/var/www/vsftpd/$inUser") || print $!;

# Configuración de los Permisos
my $chown = system("chown -R ftpsecure:nogroup /var/www/vsftpd");



######eliminar####3

# CONEXION PERL MYSQL 
my $dbh = DBI->connect($database, $user, $pw) || die "No se pudo conectar a la Base de datos: $DBI::errstr";

my $queryDropUser = $dbh->do("SELECT * FROM $tablaname WHERE username = '$inUser'");


exit;


