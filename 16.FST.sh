
input=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/03.based_population/02.shapeit_merge/03.filter_shapeit_merge/02.noindel_overlap
output=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/012.sweep/02.fst

for i in `seq 1 18`
do

vcftools --gzvcf ${input}/chr${i}.vcf.gz \
--weir-fst-pop ${g1}.id \
--weir-fst-pop ${g2}.id \
--out chr${i}_${g1}-${g2}

done
