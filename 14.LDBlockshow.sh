ldshow=/home/goldenpigs/software/LDBlockShow-1.40/bin
gtf=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/003.sus11.1.fa/Sus_scrofa.Sscrofa11.1.105.gtf
vcf=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/03.based_population/02.shapeit_merge/03.filter_shapeit_merge/02.noindel_overlap
geno=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/04.imputation/09.seq937_impute90_outgroup2_plink
pop=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/007.balanceing_selection
output=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/007.balanceing_selection/03.haplo


#plot the LD block region
export PERL5LIB=/usr/lib64
${ldshow}/LDBlockShow \
-InVCF tmp.vcf \
-OutPut abc13 \
-Region 10:999-1000 \
-OutPdf -SeleVar 2 




