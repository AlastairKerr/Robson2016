# Robson2016

##Scripts used in Robson et al 2016

### sample.pl
Randomly selects 500 features from a bed file, useful for between-file normalisation.

### smp.sh (requires bedtools v2.25.0, R with ggplot2 & Rscript and sample.pl) 
For each of 2 bed files:  
* Extract 500 samples within a bed file and calculate the number of overlaps to a randomised set of the same file.
* Create 1000 replicates and plot histograms using ggplot2 in R.

## Data files 
* Contactdomainsasbedfile.bed : TADs from HiC 
* hg19.genome : chromosomal lengths 
* LADS-a.bed : LADs detected in Activated 
* LADS-r.bed : LADs detected in Repressed


