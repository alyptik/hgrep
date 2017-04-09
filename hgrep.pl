#!/usr/bin/perl -s

use strict;
use warnings;
use File::Grep qw( fgrep fmap fdo );

my $usage = "Usage: hgrep <query>\n";
my $version = v0.1;
my @query = @ARGV;

# Parse command line switches
{
	no strict;
	no warnings;

	print $usage if $h;
	printf "hgrep %vd\n", $version if $v;
}

print join(" ", @query)."\n";
