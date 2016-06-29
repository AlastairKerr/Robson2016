#!/usr/bin/perl -w


use List::Util 'shuffle';

open(A, shift) or die $!;

my @file = <A>;
my $tries =  shift;
print join ("", &rndsample(\@file, $tries));


sub rndsample{
    my $sample = shift;;
    my $picks = shift;
    my @sample = @$sample;
# Shuffled list of indexes into @sample
    my @idx = (0..$#sample);
    @idxS = shuffle(@idx);
# Get just N of them.
    my @pick_indexes = @idxS[ 0 .. $picks - 1 ];  

# Pick cards from @sample
    my @picks = @sample[ @pick_indexes ];
    return(@picks);
}

