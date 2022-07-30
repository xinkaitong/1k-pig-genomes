
gatk=/home/software/bin/gatk
vcf=/home/software/vcftools_0.1.13/cpp/vcftools
samtools=/opt/software/anaconda2/bin/samtools
ref=/home/2.Tongxinkai/1.data/0.index/8.Sscrofa11.1.BWA_withchr/susScr11.fa
variant_source=/home/2.Tongxinkai/1.data/1.dpsnp/Sus_scrofa11_1_endnospace.vcf
input=/home/2.Tongxinkai/17.Thousandpigs/004.pre-analysis/03.vcf_gvcf/chr${N[$PBS_ARRAYID]}
output=/home/2.Tongxinkai/17.Thousandpigs/004.pre-analysis/04.joincalling/chr${N[$PBS_ARRAYID]}

cd ${input}
gvcf=(`ls *g.vcf.gz`)
GVCF_list=''

for i in ${gvcf[@]}
do 
GVCF_list=${GVCF_list}" -V ${input}/${i}"
done

echo ${GVCF_list[@]}

#建立基因组数据库，加速运行速度
${gatk} GenomicsDBImport \
-R ${ref} \
$GVCF_list \
--genomicsdb-workspace-path chr${N[$PBS_ARRAYID]}_my_database \
--intervals chr${N[$PBS_ARRAYID]} \
--tmp-dir=${temp} 

#基因分型
TILEDB_DISABLE_FILE_LOCKING=1 ${gatk} GenotypeGVCFs \
-R ${ref} \
-V gendb://chr${N[$PBS_ARRAYID]}_my_database \
-O chr${N[$PBS_ARRAYID]}_raw.vcf 

cp chr${N[$PBS_ARRAYID]}_raw.vcf ${output}/
cd ..
rm -r ${temp}



