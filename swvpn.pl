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
use LWP::UserAgent;
use Net::Ping;
use Net::Twitter::Lite;

#my $fileLoc = "/var/log/state.txt";
my $archLog = "/var/log/estadoRouters.txt";
#my @hosts = ( "172.16.2.240", "172.18.1.254", "172.18.3.254", "172.18.4.254", "172.18.5.254", "172.18.6.254" );
my @routers = ( "172.16.2.240", "172.18.1.254", "172.18.3.254", "172.18.4.254", "172.18.5.254", "172.18.6.254" );
#my @hostStates = ();
my @EstatusRouters = ();
#my $fh = FileHandle->new("< $archLog");
my $fh = FileHandle->new("< $fileLoc");
while ( <$fh> ) {

#	my( $line ) = $_;
	my( $posicion ) = $_;
#	chomp( $line );
	chomp( $posicion );
#	push ( @hostStates, $line );
	push ( @EstatusRouters, $posicion );
}
$fh->close;

#my $fh = FileHandle->new("> $fileLoc");
my $fh = FileHandle->new("> $archLog");
$fh->close;
foreach my $router ( @routers ) {
	my $previousState = getPreviousState( $host );
	my $url = "http://$host";
	my $ua = LWP::UserAgent->new;
	my $response = $ua->get( $url );
	my $currentState = $response->code;
	my $time = localtime;

	# If states are not equal we need to notify someone
	if ( $previousState ne $currentState ) { 

		# Do we have an status code?
		if ( $response->code ) {

			reportError("$host reports
			$response->message.\n");

		} else {

		# HTTP is not responding, 
                # is it the network connection down?
		my $p = Net::Ping->new("icmp");
		if ( $p->ping( $host, 2 )) {

			reportError ( "$host is responding, 
			     but Apache is not.\n" );

		} else {

			reportError ( "$host is unreachable.\n" );

		}

	}

	# Not done yet, we need to log 
        # the current state for future use
	logState( $host, $currentState, $time )

}

sub reportError ($) {

	my ( $msg ) = @_;
	my $nt = Net::Twitter::Lite->new(
		username => $username, 
		password => $pasword );

	my $result = eval { $nt->update( $msg ) };

	if ( !$result ) {

		# Twitter has failed us,
		# need to get the word out still...
		smsEmail ( $msg );

	}

}

sub smsEmail ($) {

	my ( $msg ) = @_;
	my $to = "7735551234\@txt.exaple.org";
	my $from = "pdw\@weinstein.org";
	my $subject = "Service Notification";

	my $sendmail = '/usr/lib/sendmail';
	open(MAIL, "|$sendmail -oi -t");
		print MAIL "From: $from\n";
		print MAIL "To: $to\n";
		print MAIL "Subject: $subject\n\n";
 		print MAIL $msg;
	close( MAIL );

}

sub logState ($$$) {

	my ( $host, $state, $time ) = @_;

	# Create a filehandle on our log file
	my $fh = FileHandle->new(">> $fileLoc");
	if (defined $fh) {

	        # Print to file the necessary information,
                # delimited with a colon
		print $fh "$host:$state:" .$time->datetime. "\n";
		$fh->close;
 	}
}

#sub getPreviousState ($) {
sub EstusPrevRouter ($) {

#	my ( $host ) = @_;
	my ( $router ) = @_;

#	foreach ( @hostStates ) {
	foreach ( @EstatusRouteres ) {

#		my( $line ) = $_;
		my( $posicion ) = $_;
#		my ($domain, $state, $time) = split(/:/, $line, 3);
		my ($router, $estatus, $hora) = split(/:/, $posicion, 3);
#		if ( $domain eq $host ) {
		if ( $domain eq $host ) {

			return $estatus;

		}

 	}

}
