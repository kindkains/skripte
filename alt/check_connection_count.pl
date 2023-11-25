#!/usr/bin/perl
#

use strict;
use Getopt::Long;

my $ip;
my $user;
my $passwd;

GetOptions(
	"host|hostname=s" => \$ip,
	"user|username=s" => \$user,
	"pass|password=s" => \$passwd,
	
);


my $cmd = 'mysql -u '.$user.' -h '.$ip.' -p\''.$passwd.'\' -e \'select host from information_schema.processlist where user="KO_PLRLP_LIVE"\'';

my $data = {};

open(CMD,"-|", $cmd);
while (my $line = <CMD>) {
	$line =~ s/\r?\n//g;
	(my $host = $line) =~ s/(.+):.*/$1/;
	$data->{$host} = 1;
}
close(CMD);

my $size = scalar(keys(%$data));

print "Vewa Database counts $size session(s)|count=$size\n";
