shapeit4=/home/goldenpigs/software/shapeit4-4.2.2/bin/shapeit4.2
clustalo=/home/goldenpigs/1.Huangyizhong/softwares/miniconda3/bin/clustalo
panel=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/03.based_population/02.shapeit_merge/03.filter_shapeit_merge/02.noindel_overlap/chr13.vcf.gz
out=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/009.Pygmyhog/05.outgroup/03.muc13/chr13_merge.vcf.gz
workdir=/home/goldenpigs/2.Tongxinkai/17.Thousandpigs/009.Pygmyhog/06.haplo_cluster

cd $workdir

${clustalo} -i id_hap.fa  -o id_hap_multi.fa --force --threads=4

FastTree id_hap_multi.fa > id_hap_multi.fa.tre  




