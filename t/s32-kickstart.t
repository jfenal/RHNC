#!/usr/bin/perl
#
#===============================================================================
#
#         FILE:  s32-kickstart
#
#  DESCRIPTION:  test rhnc-ks
#
#       AUTHOR:  Jérôme Fenal
#      CREATED:  11/09/2010
#===============================================================================

use strict;
use warnings;
use Data::Dumper;
use lib qw( . lib lib/RHNC );
use Cwd qw( abs_path );

use Test::More;    # last test to print
my $script = 'rhnc-ks';

eval "use Test::Script::Run qw( :all )";
plan skip_all => "Test::Script::Run required for testing $script" if $@;

my $s;
for my $d (qw( . script ../script )) {
    $s = "$d/$script" if -f "$d/$script";
}

$s = abs_path $s;

my $tests;
plan tests => $tests;

BEGIN { $tests++; }
ok( defined $s, "script to test found : $s" );

my ( $return_code, $stdout, $stderr );

BEGIN { $tests++; }
run_not_ok( $s, [qw( )], "$script (no arg)" );

BEGIN { $tests++; }
run_ok( $s, [qw( list )], "$script list" );
my @ks = split /\n/, last_script_stdout();

