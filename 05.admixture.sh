geno=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/04.imputation/09.seq937_impute90_outgroup2_plink/
output=/home/2.Tongxinkai/17.Thousandpigs/006.population_structure/01.admixture/11.allsample_admixture

plink --bfile genodata \
--indep-pairwise 50 5 0.5 \
--make-bed \
--out se_id2 


admixture --cv se_id2.bed $K -j40



