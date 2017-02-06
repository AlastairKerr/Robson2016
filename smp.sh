#!/bin/bash

OVERLAP=1

display_usage() { 
    echo "Usage: $0 bedfile1 bedfile2 outputname." 
    } 

# if less than three arguments supplied, display usage 
if [  $# -le 2 ] 
    then 
    display_usage
    exit 1
    fi 

# check whether user had supplied -h or --help . If yes display usage 
if [[ ( $# == "--help") ||  $# == "-h" ]] 
    then 
    display_usage
    exit 0
    fi 

#usage 
rm -f $1.rnd  $2.rnd
rm -f $1.srnd $2.srnd

#1000 reps 
for i in {1..1000}
do
#normalise to 500 samples 
perl sample.pl $1 500 > tmp.bed 
perl sample.pl $2 500 > tmp2.bed 

#using bedtools v2.25.0
bedtools shuffle  -excl hg19_gaps_s.bed \
	 -maxTries 10000 -g hg19.genome \
	 -i tmp.bed  -chrom -noOverlapping > tmp-r.bed

bedtools shuffle  -excl hg19_gaps_s.bed \
	 -maxTries 10000 -g hg19.genome \
	 -i tmp2.bed  -chrom -noOverlapping > tmp2-r.bed

bedtools intersect -wa -u -f $OVERLAP  \
	 -b Contactdomainsasbedfile.bed \
	 -a tmp.bed| sort -u | wc -l >> $1.rnd

bedtools intersect -wa -u -f $OVERLAP \
	 -b Contactdomainsasbedfile.bed \
	 -a tmp2.bed| sort -u | wc -l >> $2.rnd

bedtools intersect -wa -u -f $OVERLAP \
	 -b Contactdomainsasbedfile.bed \
	 -a tmp-r.bed| sort -u | wc -l >> $1.srnd

bedtools intersect -wa -u -f $OVERLAP \
	 -b Contactdomainsasbedfile.bed \
	 -a tmp2-r.bed | sort -u | wc -l >> $2.srnd
done 

Rscript plot_his.R $1.rnd  $2.rnd $1.srnd  $2.srnd $3
