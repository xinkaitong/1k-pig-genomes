#!/bin/bash
#PBS -N BWA_mapping_platypus
#PBS -l nodes=1:ppn=20,mem=15gb
#PBS -e /home/goldenpigs/2.Tongxinkai/log/BWA_mapping_e
#PBS -o /home/goldenpigs/2.Tongxinkai/log/BWA_mapping_o
#PBS -q cu
#PBS -t 0-6

# Kill script if any commands fail
set -e

input=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/009.Pygmyhog
ref=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/003.sus11.1.fa/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa
output=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/009.Pygmyhog/01.bam
# vcfout=/home/goldenpigs/2.Tongxinkai/1.data/3.Thousandpigs/1000.vcf

uid="xinkai"
ls_date=`date +m%d%H%M%S`
line=${PBS_ARRAYID}
temp=/tmpdisk/${uid}_${ls_date}_${line}
mkdir ${temp}
cd ${temp}
# cd $input
# a=(`ls *_1.fq.gz`)
# ID_1=(${a[@]//_1.fq.gz/})
# ID=${ID_1[${PBS_ARRAYID}]}

allid=(trimmed_ERR2984766 trimmed_ERR2984767 trimmed_ERR2984768 trimmed_ERR2984769 trimmed_ERR2984770 trimmed_ERR2984771 trimmed_ERR2984772)
ID=${allid[$line]}
#ID=`sed -n "${line}p" $input | cut -f1 | cat`
#fastq1=`sed -n "${line}p" $input | cut -f2 | cat`
#fastq2=`sed -n "${line}p" $input | cut -f3 | cat`

RG="@RG\\tID:${ID}\\tPL:ILLUMINA\\tSM:${ID}\\tLB:${ID}\\tPU:1"
#cat $fastq1 > ${ID}.fastq1.fq.gz
#cat $fastq2 > ${ID}.fastq2.fq.gz

#bwa mem -t 20 -R ${RG} ${ref} ${input}/${ID}_1.fq.gz ${input}/${ID}_2.fq.gz 
bwa mem -t 20 -R ${RG} ${ref} ${input}/${ID}_1.fastq.gz ${input}/${ID}_2.fastq.gz \
|samtools view -@ 10 -hSb > ${ID}.bam
samtools sort -@ 10 -o ${ID}.sorted.bam ${ID}.bam
samtools index ${ID}.sorted.bam

mv ${ID}.sorted.bam ${output}/
mv ${ID}.sorted.bam.bai ${output}/

#PCR去重
time picard MarkDuplicates -Xmx64g \
I=${output}/${ID}.sorted.bam \
O=${ID}.sorted.markdup.bam \
M=${ID}.sorted.markdup.txt \
REMOVE_DUPLICATES=true

samtools index ${ID}.sorted.markdup.bam

mv ${ID}.sorted.markdup.bam* ${output}/

cd ..
rm -r ${temp}





#vcftools=/home/goldenpigs/software/vcftools_0.1.13/cpp/vcftools
#bgzip -c -f -@ 10 B194.platypus.vcf > B194.platypus.vcf.gz
#bcftools index B194.platypus.vcf.gz
#bcftools merge --threads 20 \
#B17.platypus.vcf.gz B194.platypus.vcf.gz D17.platypus.vcf.gz D192.platypus.vcf.gz -o merge.vcf.gz
#nohup cat D17.platypus.vcf D192.platypus.vcf |grep "PASS"|cut -f 1-5|sort -k 1,1g -k 2,2g -u > drc.vcf &
#bgzip -c drc1.vcf > drc1.vcf.gz
#tabix -p vcf drc1.vcf.gz


#input=/home/goldenpigs/2.Tongxinkai/1.data/3.Thousandpigs/single_lane
#ref=/home/goldenpigs/2.Tongxinkai/1.data/0.index/8.Sscrofa11.1.BWA_withchr/susScr11.fa
#output=/home/goldenpigs/2.Tongxinkai/1.data/3.Thousandpigs/single_lane_bam
#temp=/tmpdisk/single_lane
#cd ${input}
#a=(`ls *`)
#b=(${a[@]//.fastq.gz/})
#cd ${temp}
#for id in ${b[@]}
#do
#ID=${id}
#RG="@RG\\tID:${ID}\\tPL:ILLUMINA\\tSM:${ID}\\tLB:${ID}\\tPU:1"
#bwa mem -t 40 -R ${RG} ${ref} ${input}/${ID}.fastq.gz \
#|samtools view -@ 10 -hSb > ${ID}.bam
#samtools sort -@ 10 -o ${ID}.sorted.bam ${ID}.bam
#samtools index ${ID}.sorted.bam
#done









