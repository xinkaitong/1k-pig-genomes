
HapcutDir=/opt/software/HapCUT2/build
ref=/home/2.Tongxinkai/1.data/0.index/8.Sscrofa11.1.BWA_withchr/susScr11.fa
input=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/02.joincalling/final_plink_chr
output=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/02.joincalling/final_plink_chr/03.haplotyping_based_reads
bam=/home/zhiyan/ThousandPig/bam_3


${HapcutDir}/extractHAIRS --ref ${ref} --mbq 13 --mmq 20 --indels 1 \
--VCF ${sample_id}.unphase.vcf \
--bam ${bam}/${sample_id}.sorted.bam \
--out ${sample_id}_frgfile

${HapcutDir}/HAPCUT2 --fragments ${sample_id}_frgfile \
--VCF ${sample_id}.unphase.vcf \
--output ${sample_id}.phased.txt

awk '{if($1~/BLOCK/){print $0}else{sub(/:.*/, " ", $8); NF=11; print}}' \
${sample_id}.phased.txt > ${sample_id}.fixed.txt

whatshap hapcut2vcf -o ${sample_id}.chr${chrN[$PBS_ARRAYID]}.phased.vcf ${sample_id}.vcf ${sample_id}.fixed.txt




