#!/usr/bin/perl

use strict;
my %gefunden;

open (FINDLIST, "find @ARGV -type f | sort -u |") or die "Fehler beim ausfuehren von find: $!\n";
while (<FINDLIST>) {
   chomp;
      next if (-d $_);                  # Verzeichnisse ueberspringen
         my $filename=(split /\//)[-1];    # Verzeichnisnamen wegschneiden
            if ($gefunden{$filename} > 0) {   # War die Datei schon mal da?
                 print "loesche $_\n";
                 #     unlink $_;                      # Wenn man sich der Sache sicher ist...
                    } else {
                         $gefunden{$filename}++;
                            }
                            }
                            close FINDLIST;
