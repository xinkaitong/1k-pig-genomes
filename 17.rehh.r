
input='/home/111'
group='/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/012.sweep/00.group'
output='/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/012.sweep/01.xpehh'

library(rehh)
load('${input}/chr${i}.Rdata')

x1 <- read.table('${group}/${g1}.group',header=FALSE,sep=',') 
x2 <- as.vector(unlist(x1))
y1 <- read.table('${group}/${g2}.group',header=FALSE,sep=',') 
y2 <- as.vector(unlist(y1)) 

subset1_chr${i} = subset(chr${i}, select.hap = x2) , min_maf = 0)
subset2_chr${i} = subset(chr${i}, select.hap = y2) , min_maf = 0)

scan1_chr${i} <- scan_hh(subset1_chr${i}, polarized = FALSE,threads = 40)
scan2_chr${i} <- scan_hh(subset2_chr${i}, polarized = FALSE,threads = 40)

xpehh <- ies2xpehh(scan_pop1 = scan1_chr${i},scan_pop2 = scan2_chr${i},
                       popname1 = '${g1}', popname2 = '${g2}',
                       include_freq = T)

write.table(xpehh,file ='xpehh_chr${i}.${g1}_${g2}.txt',
 row.names = TRUE, col.names =TRUE, sep='\t',quote =FALSE)


rsb <- ines2rsb(scan_pop1 = scan1_chr${i},scan_pop2 = scan2_chr${i},
                       popname1 = '${g1}', popname2 = '${g2}',
                       include_freq = T)

write.table(rsb,file = 'rsb_chr${i}.${g1}_${g2}.txt',
 row.names = TRUE, col.names =TRUE, sep='\t',quote =FALSE)




