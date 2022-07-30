imp5Chunker=/home/software/impute5_v1.1.5/imp5Chunker_1.1.5_static
imp5Converter=/home/software/impute5_v1.1.5/imp5Converter_1.1.5_static
impute5=/home/software/impute5_v1.1.5/impute5_1.1.5_static
reference=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/03.based_population/02.shapeit_merge
target=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/04.imputation

cd $target

${shapeit4} --input filter_geno_delete.vcf.gz \
--reference ${reference}/chr${chr}.vcf.gz \
--region ${chr} \
--thread 10 \
--sequencing \
--log phased.log \
--output filter_geno_delete.phased.vcf 

bgzip -@ 10 filter_geno_delete.phased.vcf 
tabix -p vcf filter_geno_delete.phased.vcf.gz


$impute5 --h ${reference}/chr${chr}.vcf.gz \
--g filter_geno_delete.phased.vcf.gz \
--r ${chr} \
--o chr${chr}.imputed.vcf.gz \
--l imputed.log \
--threads 10



