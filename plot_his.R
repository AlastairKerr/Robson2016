#!/env/Rscript

args <- commandArgs(trailingOnly = TRUE)

library(ggplot2)
library(reshape2)
data1 <- scan(args[1])
data2 <- scan(args[2])
data3 <- scan(args[3])
data4 <- scan(args[4])
df <-  data.frame(data1=data1, data2=data2, data3=data3, data4=data4) 
df.long = melt(df) 
p<- ggplot(df.long, aes(value, fill=variable)) + geom_histogram(bins=150) +
    ylab("Frequency") + xlab("Number of Overlaps") +
#    geom_vline(xintercept=overlap, size=2) + 
    theme_bw() 

ggsave(args[5], p)
