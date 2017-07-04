#!/usr/bin/perl
use Math::MatrixReal;
my $matrix1 = Math::MatrixReal->new_from_string(<<'MATRIX');
[ 3 4 5 ]
[ 1 5 0 ]
[ -1 1 2 ]
MATRIX

my $matrix2 = Math::MatrixReal->new_from_string(<<'MATRIX');
[ 1 0 ]
[ 2 1 ]
[ -1 1 ]
MATRIX

my $matrix3 = Math::MatrixReal->new_from_string(<<'MATRIX');
[ 1 0 ]
[ 2 1 ]
[ -1 1 ]
MATRIX

my $prod = $matrix1 * $matrix2;

print "$prod\n";
