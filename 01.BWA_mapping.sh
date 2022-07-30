
RG="@RG\\tID:${ID}\\tPL:ILLUMINA\\tSM:${ID}\\tLB:${ID}\\tPU:1"

bwa mem -t 20 -R ${RG} ${ref} ${input}/${ID}_1.fastq.gz ${input}/${ID}_2.fastq.gz \
|samtools view -@ 10 -hSb > ${ID}.bam
samtools sort -@ 10 -o ${ID}.sorted.bam ${ID}.bam
samtools index ${ID}.sorted.bam

time picard MarkDuplicates -Xmx64g \
I=${output}/${ID}.sorted.bam \
O=${ID}.sorted.markdup.bam \
M=${ID}.sorted.markdup.txt \
REMOVE_DUPLICATES=true

samtools index ${ID}.sorted.markdup.bam




