genodata=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype
workdir=/home/2.Tongxinkai/17.Thousandpigs/006.population_structure/02.phylogenetic

cd $workdir

plink --bfile genodata \
--distance-matrix \
--out allsite_distance

cut -f2 allsite_distance.mdist.id | awk '{print "txk"NR,$1}' > id.index

cut -d' ' -f1 id.index > pseudo.id 

paste -d' ' pseudo.id allsite_distance.mdist | \
awk 'BEGIN{print "\t"1019}\
{printf("%-10s",substr($1,1,10));for(i=2;i<=NF;i++){printf " "$i};printf "\n"}' > mdist.phylip

rm neighbor.par outfile outtree
echo "mdist.phylip" >> neighbor.par
echo "Y" >> neighbor.par

phylip neighbor < neighbor.par
mv outfile pseudo.outfile 
mv outtree pseudo.outtree 
cp pseudo.outtree tid.outtree





