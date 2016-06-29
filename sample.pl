#!/usr/bin/perl -w


use List::Util 'shuffle';

open(A, shift) or die $!;

my @file = <A>;
my $tries =  shift;
print join ("", &rndsample(\@file, $tries));


sub rndsample{
    my $deck = shift;;
    my $picks = shift;
    my @deck = @$deck;
# Shuffled list of indexes into @deck
    my @idx = (0..$#deck);
#    shuffle_array @idx;
#    my @shuffled_indexes = shuffle_array @idx;
    @idxS = shuffle(@idx);
# Get just N of them.
    my @pick_indexes = @idxS[ 0 .. $picks - 1 ];  
#   my @pick_indexes = @shuffled_indexes[ 0 .. $picks - 1 ];  

# Pick cards from @deck
    my @picks = @deck[ @pick_indexes ];
    return(@picks);
}

