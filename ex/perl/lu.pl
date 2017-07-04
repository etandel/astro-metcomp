#!/usr/bin/perl
use Math::MatrixReal;
my $matrix = Math::MatrixReal->new_from_string(<<'MATRIX');
[ 1 0 0 0 0 0 1 ]
[ 0 1 0 0 0 0 0 ]
[ 0 0 1 0 0 0 0 ]
[ 0 0 0 1 0 0 0 ]
[ 0 0 0 0 1 0 0 ]
[ 0 0 0 0 0 1 0 ]
[ 1 0 0 0 0 0 -1 ]
MATRIX

my $vector = Math::MatrixReal->new_from_string(<<'MATRIX');
[ 1 ]
[ 2 ]
[ 3 ]
[ 1 ]
[ 5 ]
[ 6 ]
[ 7 ]
MATRIX

# Decomposicao LU
my $LU = decompose_LR $matrix;
($dimension, $solution, $base_matrix) = $LU->solve_LR( $vector );
print "$solution\n";
