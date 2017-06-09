my $mystring ;
$mystring = "Hello world! \n" ;

# a string contem a palavra "World" ?
if ($mystring =~ m/World/) { print "Yes \n" ; }

# a string contem a palavra "World", independente da caixa ?
if($mystring =~ m/World/i) { print "Yes \n" ; }

# troca "Hello world!" para "Hello mom!"
$mystring =~ s/world/mom/ ;

print "$mystring \n";
# troca "Hello mom!" para "Goodbye mom!"

$mystring =~ s/hello/Goodbye/i;
print "$mystring \n";
