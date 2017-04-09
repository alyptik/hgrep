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
my $num;
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
	$num = $n // 10;
}

print "# of matches that will be printed: ".$num."\n"."Queries: \"".join("\" \"", @query)."\"\n";

# Traverse desired filesystems
File::Find::find({wanted => \&wanted}, '/usr/include');

exit;

sub wanted {
	my ($dev, $ino, $mode, $nlink, $uid, $gid);
	(($dev, $ino, $mode, $nlink, $uid, $gid) = lstat($_)) &&
		-f _ && /^.*\.h\z/s && push @files, $name &&
		map {
			my $cur = $_;
			fgrep {
				$num-- && print $_ if m/$cur/;
				exit if $num == 0;
			} $name;
		} @query;
		# TODO: Get colors working
		# map { my $cur = $_;
		#         fgrep {
		#                 s/$cur/$'\033'[31m$&$'\033'[0m/g && print $_ if m/$cur/
		#         } $name
		# } @query;
}

