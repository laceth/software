#!/usr/bin/perl -w
use strict;
use module test

# pg 25 Perl Functions for List Data - How to Tutorial.pdf
my @array1 = (1, 2, 3, 5, 7, 23, 8, 14, 95, 19);
my @array2 = (3, 14, 6, 22, 88, 19, 100);
my %hash1 = map{$_ => 1} @array1;
my %hash2 = map{$_ => 1} @array2;
# the intersection of @array1 and @array2
my @array12 = grep $hash1{$_}, @array2;
my @array21 = grep $hash2{$_}, @array1;
print "@array12\n"; # it prints: 3 14 19
print "@array21\n";
# the difference between @array1 and @array2
my @array1_2 = grep !defined $hash2{$_}, @array1;
print "@array1_2\n"; # it prints: 1 2 5 7 23 8 95
# the difference between @array2 and @array1
my @array2_1 = grep !defined $hash1{$_}, @array2;
print "@array2_1\n"; # it prints: 6 22 88 100

my @AoA = (
[ qw(Yellow Blue LightBlue DeepPink) ],
[ qw(DarkGreen DarkMagenta LightYellow) ],
[ 'Red', 'LightCyan', 'LightCoral', 'Green']
);
my @result = grep { $_ =~ /light/i} map { @$_ } @AoA;
print "@result\n";

my @AoH1 = (
{name=>'John', age=>23},
{name=>'Alice', age=>31},
{name=>'Peter', age=>45},
);
my @subAoH = grep { $_->{age} > 30 } @AoH1;
print join "\n",
map {$_->{name}." is ".$_->{age}. " years old."} @subAoH;
print "\n";

#open(FH,"< $auditlogslist")  || die "Cannot read file:$!";
#BAN,Order ID chomp, push @colors, $_ while(<FH>);
#146216263,1919797538
open FILE, "ban_orders.csv" or die $!;
my @AOA = map { chomp; [split /,/]; } <FILE>;
# print the @AOA array
foreach my $item1 (@AOA){
foreach my $item2 (@{$item1}){
print "$item2 ";
}
print "\n";
}

#In the following example the foreach loop is used to transform an array into a hash.
#See the code:  pg 41 Perl Functions for List Data - How to Tutorial.pdf
open FILE, "ban_orders.csv" or die $!;
my @Arry;
while(<FILE>) {
chomp;
push @Arry, {split /,/};
}

# print the @AoH array
#foreach my $item ( @AoH ){
#foreach my $key ( keys %{ $item } ){
#print "$key=$item->{ $key }\t";
#}
#print "\n";
#}
my %hash_i;
foreach (@Arry) {
my @tmp = split (/\s/);
$hash_i{$tmp[0]} = $tmp[1];
}
print "$_ => $hash_i{$_}\n" foreach (keys %hash_i);


#Below the same example is rewritten using the map function pg  43
# Perl Functions for List Data - How to Tutorial.pdf

## initialize an array
#my @array = ('1-one', '2-two', '3-three',
#'4-four', '5-five', '6-six');
#my %hash = map split (/-/), @array;
#print map { "$_ => $hash{$_}\n" } keys %hash;


###############################################################################
#In the following example the foreach loop is used to transform an array into a hash.
#See the code:  pg 41 Perl Functions for List Data - How to Tutorial.pdf
#!/usr/local/bin/perl
use strict;
use warnings;
# initialize an array
my @array_new = ('1-one', '2-two', '3-three',
'4-four', '5-five', '6-six');
my %hash_n;
foreach (@array_new) {
my @tmp = split /-/;
$hash_n{$tmp[0]} = $tmp[1];
}
print "$_ => $hash_n{$_}\n" foreach (keys %hash_n);
###########################################################################
open FILE1, "ban_orders2.csv" or die $!;
open FILE2, "Daily_run_orders.csv" or die $!;
my @AoH2;
my @AoH3;  # pg 48  Perl Complex Data Structures - How to Tutorial.pdf
while(<FILE1>) {
chomp;
push @AoH2, (split(/,/))
}
while(<FILE2>) {
chomp;
push @AoH3, (split(/,/))
}

# print the @AoH2 array
foreach my $item ( @AoH2 ){
foreach my $key ( keys %{ $item } ){
print "$key=$item->{ $key }\t";
}
print "\n";
}
# print the @AoH2 array
for (my $i = 0; $i <= $#AoH2; $i++) {
my @tmp = keys %{$AoH2[$i]};
for( my $j = 0; $j <= $#tmp; $j++ ) {
print "$tmp[$j]=$AoH2[$i]->{$tmp[$j]}\t";
}
print "\n";
}

my %hash__i = map{$_ => 1} @AoH2;
my %hash__old = map{$_ => 1} @AoH3;
#y @subAoH_n = grep {"keys %hash_i{$_}"} @AoH2;
my @subAoH_n = grep {$hash_i{$_}} @AoH3;
print join "\n", #pg 28 Perl Functions for List Data - How to Tutorial.pdf
map {$_->{ban}." is ".$_->{order id} } @subAoH_n;
print "\n";
 
 
 
 
 # PG 69  Perl Complex Data Structures - How to Tutorial.pdf

#sub myPrint{
#my $arrayRef = shift;
#foreach my $item1 ( @$arrayRef ){
#while(my ($key, $val) = each % {$item1}) {
#print("$key => $val\t");
#}
#print "\n";
#}__

#open(FH,"< $auditlogslist")  || die "Cannot read file:$!";

#chomp($_); # remove \n new line from string
#while($_=<FH>)

my $str = '1:one,2:two,3:three,4:four';
my %hash = map { split /:/, $_ } split /,/, $str;
# print the hash
while ( my ($key, $val) = each %hash ) {
print "$key->$val\n";
}


## initialize an array
#my @array = ('1-one', '2-two', '3-three',
#'4-four', '5-five', '6-six');
#my @subArray = grep length gt 5, @array;
#print "\@subArray = @subArray\n";
##my %hash = map { split /-/ } @array;
#print "\%hash:\n";
#print map { "$_ => $hash{$_}\n" } keys %hash;
