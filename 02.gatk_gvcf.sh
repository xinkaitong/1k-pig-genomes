

gatk=/home/software/bin/gatk
samtools=/opt/software/anaconda2/bin/samtools
vcf=/home/software/vcftools_0.1.13/cpp/vcftools
ref=/home/2.Tongxinkai/1.data/0.index/8.Sscrofa11.1.BWA_withchr/susScr11.fa
dict=/home/2.Tongxinkai/1.data/0.index/8.Sscrofa11.1.BWA_withchr/susScr11.dict
variant_source=/home/2.Tongxinkai/1.data/1.dpsnp/Sus_scrofa11_1_endnospace.vcf
input=/home/2.Tongxinkai/17.Thousandpigs/01.bam
output=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/03.vcf_gvcf/${chr}

#samtools faidx ${ref}
#picard CreateSequenceDictionary R=${ref} O=${dict}
#${gatk} IndexFeatureFile -I $variant_source

cd ${input}
a=(`ls *bam`)
id=(${a[@]//.sorted.bam/})
ID=${id[$PBS_ARRAYID]}

#PCR去重
time picard MarkDuplicates -Xmx64g \
I=${input}/${ID}.sorted.bam \
O=${ID}.sorted.markdup.bam \
M=${ID}.sorted.markdup.txt \
REMOVE_DUPLICATES=true

#建索引
time picard BuildBamIndex -Xmx64g I=${ID}.sorted.markdup.bam

#计算去重后的统计量
#time ${samtools} flagstat -@ 20 ${ID}_${chr}.sorted.markdup.bam > ${ID}_${chr}.sorted.markdup.stat

#矫正碱基质量
time ${gatk} BaseRecalibrator \
-R ${ref} \
-I ${ID}.sorted.markdup.bam \
--known-sites ${variant_source} \
-O recal_data_${ID}_${chr}.table

time ${gatk} ApplyBQSR \
--bqsr-recal-file recal_data_${ID}_${chr}.table \
-R ${ref} \
-I ${ID}.sorted.markdup.bam \
-O ${ID}.sorted.markdup.BQSR.bam

#生成gvcf文件
time ${gatk} HaplotypeCaller \
--native-pair-hmm-threads 30 \
-R ${ref} \
-I ${ID}.sorted.markdup.BQSR.bam \
-ERC GVCF \
-O ${ID}_${chr}.g.vcf.gz

tabix -p vcf ${ID}_${chr}.g.vcf.gz

cp ${ID}_${chr}.g.vcf.gz* ${output}/

cd ..
rm -r ${temp}






