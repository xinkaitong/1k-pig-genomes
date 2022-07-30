
shapeit4=/home/goldenpigs/software/shapeit4-4.2.2/bin/shapeit4.2
vcf=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/01.based_reads/06.transMAL_vcf_gz_merge/01.depth_filter/01.filter
vcf_scaffold=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/02.based_pedigree/03.2.reference/01.filter
output=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/03.based_population/01.shapeit_result

${shapeit4} --input chr.vcf.gz \
--region ${chr}:${rstart}-${rend} \
--thread 10 \
--sequencing \
--scaffold chr${chr}.vcf.gz \
--use-PS 0.0001 \
--log phased.log \
--output chr${chr}_${rstart}-${rend}.phased.vcf 

