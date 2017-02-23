#!/usr/local/bin/perl
use warnings;
use strict;
my %HoA;
while(<DATA>) {
chomp $_;# remove \n new line from string
##s/^(.*?):\s*//;   # (split(/,/)) ; if ($_=~ /\b(BAN)\b/ );{ $HoA{$1} = [split]; }
##$HoA{$1} = [split]; # selecting a scalar at particular index $1 BAN,Order 146216263,1919797538

foreach (split(/,/))
    { 
if ($_=~ /\b(BAN)\b/ )  {
    $HoA{$1} = [split];
    }
if ($_=~ /\b(Order)\b/ )  {
    $HoA{$2} = [split];
    }
 }

}
# print the @HoA hash
foreach my $key ( keys %HoA) {
print "$key: @{ $HoA{$key} }\n";
}
__DATA__
BAN,Order
146216263,1919797538
146167314,1825863416
146100072,1937333931



#colors: red blue green white
#numbers: 1 5 77 3 432
#strings: one ten