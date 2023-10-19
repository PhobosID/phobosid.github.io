#! /usr/bin/perl

use strict ;
use warnings ;

my $FMT = 'gpg --keyserver pgp.surfnet.nl --recv-key 0x%s' ;

my $prog = substr $0, rindex ( $0, '/' ) + 1 ;
my $Usage = <<USAGE ;
Usage: $prog [-v] [-q] [-d]
option v : be verbose
option q : be quiet
option d : show debug info
=========================================================
$prog reads file ASF and fetches the keys.
=========================================================
USAGE
sub Usage { die "$_[0]$Usage" ; }
sub Error { die "[error] $prog: $_[0]\n" ; }
sub Warn  { warn "[warn] $prog: $_[0]\n" ; }

# usage: &GetOptions(ARG,ARG,..) defines $opt_ID as 1 or user spec'ed value
# usage: &GetOptions(\%opt,ARG,ARG,..) defines $opt{ID} as 1 or user value
# ARG = 'ID' | 'ID=SPC' | 'ID:SPC' for no-arg, required-arg or optional-arg
# ID  = perl identifier
# SPC = i|f|s for integer, fixedpoint real or string argument

use Getopt::Long ;
Getopt::Long::config ( 'no_ignore_case' ) ;
my %opt = () ; Usage '' unless GetOptions
  ( \%opt, qw(v q d) ) ;
Usage "Arg count\n" unless @ARGV == 0 ;

@ARGV = ( qw(ASF) ) ;

while ( <> )
  { if ( /^key\s+([0-9A-Fa-f]{16})\s/ )
      { my $kid = lc $1 ;
        my $cmd = sprintf $FMT, $kid ;
        printf "running $cmd ...\n" ;
        system $cmd ;
      }
  }
