#!/usr/bin/perl -w
use strict;


# initialize an array
my @array = qw(1 21 3 3 3 3 7 21 1 5 5 9);
print "Occur once: @{getNumbers(\@array, 1)}\n";
print "Occur twice: @{getNumbers(\@array, 2)}\n";
sub getNumbers
{
my ($newArray, $n) = (shift, shift);
my %count = ();
my @tempArray = grep {$count{$_} == $n}
grep {++$count{$_} == 1}
@$newArray;
# print the %count hash
print "\%count:\n";
while ( my ($key, $value) = each(%count) ) {
print "$key => $value\n";
}
return \@tempArray;

}
# $href->{name}  $_->{item}  $a->{mfr}  ->{} arrow
# notation, used to access the elements of a hash table given by a reference.
# my $has hRef = shift @AoH; remove 1st elements key=>value pairs from hash 
# while ( my ($key, $value) = each(%count)  {block} remove each key=>vlaue from hash
# %{shift @AoH} = ();  The % symbol is used to dereference the hash reference returned by the
# shift function. my $hashRef = shift @AoH; => If you want to save the element removed (the first inner hash),
#  $AoH[$_] means a reference to the current inner hash %AOH or @AOH({})
# (%{$AoH[$_]}) hash reference is surrounding by curly braces and prepended with the % symbol to dereference it
# keys(%{$AoH[$_]})), "\n" foreach 0 .. $#AoH; $#AoH last key/value pair element
# wile( my ($index, $val) = each @array) we use the while
# statement and the each function to traverse an array and print the indices and the
# values for only those elements that are defined  block {
# print "\$array[$index] = $val\n" if defined $val;
# }
# \b(BAN)\b.(.*)   regular expresion in matches 
#  (\d{9}),(\d{10})      file ban_orders.cvs  BAN,Order 146216263,1919797538
# \b(BAN)\b,\b(Order)\b
# (\d{9}),(\d{10})
# foreach my $key ( keys %HoA) {
# print "$key: @{ $HoA{$key} }\n"; # print out the value from the anonymous array given Keys of @array.
#}
# foreach loop, the keys function returns a list with the keys of the %HoA hash
# $HoA{$key} is the hash value associated with the $key, i.e. a reference to the
# corresponding anonymous array.In order to get the array, we need to dereference the array reference and precede the
# reference with the @ symbol. my @tmp = keys %HoA => put keys into array @tmp   ;$HoA{$key} 
# means array referencenotation # @$_ is
# used to dereference the reference stored in $_.




my @AoH = (
{name => 'John', age => '21'},
{name => 'Paul', age => '35'},
{name => 'Mary', age => '50'},
);
# remove the first element of @AoH and clear the hash
%{shift @AoH} = ();
# print the @AoH
foreach my $href ( @AoH ) {
print "$href->{name} is $href->{age} years old.\n";
}

# while($_=<FH>) 
#($ethernet_name,$interface_desc,$ipaddress,$ethernetport,$vlan,$mtu,$arp,$physical,$restart)= split( /,/,$_);
       
open my $txtFile, 'Meteo.txt' or die "Couldn't open file: $!\n";
my @fields;
my $template = 'A5 A6 A6 A5 A6 A6';
print "\n Prec Press Temp Humidity Wind Speed Wind Dir\n";
print " ---- ----- ---- -------- ---------- --------\n";
while (<$txtFile>) {
chomp;
@fields = unpack $template, $_;
my ($prec, $press, $temp, $humidity,
$windSpeed, $windDir) = @fields;