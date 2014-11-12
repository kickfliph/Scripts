#!/usr/bin/perl
# -*- coding: utf-8 -*-
#===================================================
# 
# Switch entre el enlace de Movistar y conexión de internet para la VPN.
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
# Created on: Abril 08, 2013 - Harold Luzardo
#
#===================================================

use strict;
use warnings;
use FileHandle;
use Time::Piece;
use Net::Ping;
use Net::Twitter::Lite;

my $srVpn = "172.16.2.297";
my $arcLoc = "/var/log/cvrouter/status.log";
my $confOvpn = "/home/administrador/Documentos/cliente3.conf";
my @routers = ( $srVpn, "172.18.1.254", "172.18.2.254", "172.18.3.254", "172.18.4.254", "172.18.5.254", "172.18.6.254" );
my $time = localtime;
my $nRact = 0;
my $nRinc = 0;
#my $vpnAba ;

sub logStatus ($$$) {
        my ( $router, $estatus, $time ) = @_;
        my $fh = FileHandle->new(">> $arcLoc");
        if (defined $fh) {
                print $fh "$router:$estatus:" .$time->datetime. "\n";
                $fh->close;
        }
}

sub nRactInc () {
my $statusUP = "activo";
my $statusDOWN = "inactivo";
foreach my $router ( @routers ) {
print "$router \n";
		my $p = Net::Ping->new("icmp");
                if ( $p->ping( $router, 2 )) {
		 logStatus ($router,$statusUP,$time);	
			print "vivo $router \n";
	  		$nRact++;
                } else {
		 logStatus ($router,$statusDOWN,$time);	
			print "muerto $router \n";
			$nRinc++;
			if ($router eq $srVpn){
			print "La Conexión Vpn está caida \n";	
			}
		}
	}
}

sub swEnlaceAba {
my $auxremoto = "remoto";
my @auxclientVpn ();

my $fh = FileHandle->new("> $confOvpn");
if (defined $fh) {
	while ( <$fh> ) {
		my( $line ) = $_;
		chomp( $line );
		push ( @auxclientVpn, $line );
			}
		$fh->close;

			if ($line eq $auxremoto){
			print "$auxremoto";
			}
print "$line \n";
		}

	}
**********************************
my ($i, $archivo_final);
 
open (ARCHIVO,'/home/lenin/pl/ultimo.csv') || die "No se puede abrir el archivo\n";
 
while ($registro = <ARCHIVO>) { #lee linea por linea el archivo
chop($registro); # quitamos el salto de linea
@campo = split(";",$registro); #creamos arreglo de los valores separados por ;
 
$archivo_final = "$campo[0];$campo[1];$campo[2];".md5_hex($campo[0]);
open(ARCHIVO_FINAL,">> archivo2.csv") || die "No se puede abrir el archivo\n";
print ARCHIVO_FINAL $archivo_final."\n"; #Escribimos la linea que acabamos de armar en el archivo resultante
$i++;
}
 
close(ARCHIVO);
print "\n\t Operación realizada Exitosamente. Se armaron $i registros\n";
*************************************




}

nRactInc ();
print "$nRact \n"; 
print "$nRinc \n";
swEnlaceAba ();
