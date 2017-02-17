#!/usr/bin/env perl

use strict;
use warnings;

# A simple way to use ANSI colors without
# using Term::ANSIColor

sub colorize {
	my ($c, $msg) = @_;
	$c = substr $c, 1, 1;
	my %color = (
		'k'		=> "\e[30m",     #black
		'K'		=> "\e[1;30m",   #black (BOLD)
		'r'		=> "\e[31m",     #red
		'R'		=> "\e[1;31m",   #red (BOLD)
		'b'		=> "\e[32m",     #blue
		'B'		=> "\e[1;32m",   #blue (BOLD)
		'y'		=> "\e[33m",     #yellow
		'Y'		=> "\e[1;33m",   #yellow (BOLD)
		'g'		=> "\e[34m",     #green
		'G'		=> "\e[1;34m",   #green (BOLD)
		'm'		=> "\e[35m",     #magenta
		'M'		=> "\e[1;35m",   #magenta (BOLD)
		'p'		=> "\e[35m",     #purple (alias for magenta)
		'P'		=> "\e[1;35m",   #purple (BOLD)
		'c'		=> "\e[36m",     #cyan
		'C'		=> "\e[1;36m",   #cyan (BOLD)
		'w'		=> "\e[37m",     #white
		'W'		=> "\e[1;37m",   #white (BOLD)
	);
	return "$color{$c}$msg\e[0m";
}

sub cprintf {
	($_) = @_;
	s/(#[KRGYBMPCW]\{)(.*?)(\})/colorize($1, $2)/egi;
	print $_;
}

cprintf("This is a sample message with #R{red bold text} and #B{blue bold text} and #m{magenta text} and normal text.\n");
