#!/usr/bin/perl -s

use strict;
use warnings;
use File::Grep qw( fgrep fmap fdo );
use File::Find ();

# Set the variable $File::Find::dont_use_nlink if you're using AFS,
# since AFS cheats.

# for the convenience of &wanted calls, including -eval statements:
use vars qw/*name *dir *prune/;
*name   = *File::Find::name;
*dir    = *File::Find::dir;
*prune  = *File::Find::prune;

sub wanted;

my $usage = "Usage: hgrep <query>\n";
my $version = v0.1;
my @query = @ARGV;
my @files;
# my @matches;
# my $total;


# Parse command line switches
{
	no strict;
	no warnings;

	print $usage if $h;
	printf "hgrep %vd\n", $version if $v;
	map { $_ = qr/$_/ } @query if $r;
	map { $_ = quotemeta $_ } @query unless $r;
}

print join(" ", @query)."\n";

# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, '/usr/include');

# print join " ", @files[100..150];
# $total = fgrep { chomp && push @matches, $_ if m/$query[0]/ } @files[100..200];
# print join("\n", @matches) . "\n" . $total;


exit;

sub wanted {
	my ($dev, $ino, $mode, $nlink, $uid, $gid);
	(($dev, $ino, $mode, $nlink, $uid, $gid) = lstat($_)) &&
		-f _ && /^.*\.h\z/s && push @files, $name &&
		fgrep { print $_ if m/$query[0]/ } $name;
		# fgrep { if (m/$query[0]/) { s/$query[0]/$'\033'[31m$&$'\033'[0m/gi; print $_; } } $name
}

