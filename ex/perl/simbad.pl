use Astro::SIMBAD::Client;

my $simbad1 = Astro::SIMBAD::Client->new ();

my $simbad2 = Astro::SIMBAD::Client->new (
    type => 'txt',
    format => {txt => <<'eod'},
    %idlist(NAME|1),
    %coord(d;A),
    %coord(d;D),
    %plx(V),
    %pm(A),
    %pm(D),
    %rv(V)\n
eod
    parser => {txt =>
    $opt{parse} ? 'parse_csv' : ''},
);


# print $simbad1->query (id => 'HD 1276');
# print $simbad2->query (id => 'HIP 204');

@stars = ('Sirius', 'HIP 301', 'HD 1586', 'eta Car');

foreach (@stars) {
    print $simbad2->query(id => $_);
}
