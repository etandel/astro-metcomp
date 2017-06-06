sub maximum {
    my $max = $_[0];
    foreach $i (@_) {
        if ($i > $max) {
            $max = $i;
        }
    }
    $max;
}


sub maximum2 {
    my $max = $_[0];
    if ($_[1] > $max) {
        $max = $_[1];
    }
    if ($_[2] > $max) {
        $max = $_[2];
    }
    $max;
}

$biggest = &maximum(37, 24);
print "$biggest \n";

$biggest = &maximum(37);
print "$biggest \n";

$biggest = &maximum(37, 24, 42);
print "$biggest \n";

$biggest = &maximum;
print "$biggest \n";


print "-----\n";

$biggest = &maximum2(37, 24);
print "$biggest \n";

$biggest = &maximum2(37);
print "$biggest \n";

$biggest = &maximum2(37, 24, 42);
print "$biggest \n";

$biggest = &maximum2;
print "$biggest \n";
