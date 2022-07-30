
#calculating Tajima's D
vcftools --vcf tmp.recode.vcf --TajimaD 1000 --out 1kb_chr${n}
