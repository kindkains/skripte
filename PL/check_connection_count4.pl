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
	if (!exists($data->{$host})) {
		$data->{$host} = 1;
	}
	else {
		$data->{$host} += 1;
	}
}
close(CMD);

my $size = 0; #scalar(keys(%$data));

foreach my $host (keys(%$data)) {
	my $c = $data->{$host};
	if ($c > 3) {
		$size += int($data->{$host}/4);
	}
	else {
		$size += 1;
	}
}

print "Vewa Database counts $size session(s)|count=$size\n";
