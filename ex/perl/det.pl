use Math::MatrixReal;

my $matrix1 = Math::MatrixReal->new_from_cols( [ [1,2], [3,4] ] );
print $matrix1;
my $matrix2 = Math::MatrixReal->new_from_rows( [ [1,2], [3,4] ] );
print $matrix2;
$string = "[ 1 2 3 ]\n[ 2 2 -1 ]\n[ 1 1 1 ]\n";
$matrix3 = Math::MatrixReal->new_from_string($string);
print "$matrix3";


# $matrix1->add($matrix2,$matrix3);
# $matrix1->subtract($matrix2,$matrix3);
# $matrix1->multiply_scalar($matrix2,$scalar);
# $product_matrix = $matrix1->multiply($matrix2);
# $matrix1->transpose($matrix2);
# $inverse = $matrix->inverse();
$det = $matrix->det();
