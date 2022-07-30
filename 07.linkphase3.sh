
linkphase3=/home/zhiyan/software/HAP/PHASEBOOK_3/SOURCES/LINKPHASE3
shapeit2=/home/software/shapeit.v2.904.2.6.32-696.18.7.el6.x86_64/bin/shapeit
genotype=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/02.joincalling/final_plink_depth_gt5/all_merge_clean
output=/home/2.Tongxinkai/17.Thousandpigs/005.renheweilai/04.haplotype/02.based_pedigree

echo -e "#PEDIGREE_FILE\nlinkphase.pedigree" > linkin.txt
echo -e "#GENOTYPE_FILE\nlinkphase.ped" >> linkin.txt
echo -e "#MARKER_FILE\nlinkphase.map" >> linkin.txt
echo -e "#HALFSIB_PHASING\nyes" >> linkin.txt
echo -e "#HMM_PHASING\nyes" >> linkin.txt
echo -e "#N_TEMPLATES\n50" >> linkin.txt
echo -e "#CHECK_PREPHASING\nyes" >> linkin.txt

${linkphase3} 







