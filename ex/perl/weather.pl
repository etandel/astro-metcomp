use Weather::Underground;

$weather = Weather::Underground->new(
    place => "Rio de Janeiro, Brazil",
    debug => 0,
    )
    || die "Error, could not create new weather object: $@\n";

$arrayref = $weather->get_weather()
    || die "Error, calling get_weather() failed: $@\n";

foreach (@$arrayref) {
    print "MATCH:\n";
    while (($key, $value) = each %{$_}) {
        print "\t$key = $value\n";
    }
}
