

# To obtain kinship for all individuals
/home/zhiyan/software/gcta_1.93.2beta/gcta64 \
--bfile array \
--autosome \
--make-grm \
--thread-num 10 \
--out kinship


# To obtain BLUP solutions for the genetic values of individuals
/home/zhiyan/software/gcta_1.93.2beta/gcta64 \
--thread-num 10 \
--reml --grm kinship \
--pheno pheno_arra.txt \
--mpheno 1 \
--reml-pred-rand \
--out array_GS 


/home/zhiyan/software/gcta_1.93.2beta/gcta64 \
--reml --grm kinship --pheno pheno_arra.txt --cvblup \
--out array_GS_pre








