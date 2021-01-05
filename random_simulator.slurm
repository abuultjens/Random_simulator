#!/bin/bash

#---------------------------------------------------------------
# setup slurm parameters

#SBATCH --time 00:20:00

##SBATCH -A punim0577
#SBATCH -A punim0927

#SBATCH -p physical
##SBATCH -p bigmem

#SBATCH --nodes=1
#SBATCH --ntasks=1

#SBATCH --mem 50G

#---------------------------------------------------------------
# load modules

# use old stack
source /usr/local/module/spartan_old.sh

# pandas
module load pandas/0.23.4-goolf-2015a-Python-2.7.12

# numpy
module load numpy/1.8.2-intel-2016.u3-Python-2.7.9

# scikit-learn
module load scikit-learn/0.18-intel-2016.u3-Python-2.7.9

# python-dateutil (must be loaded last)
module load python-dateutil/2.6.1-goolf-2015a-Python-2.7.12

#---------------------------------------------------------------
# read in cmd attributes

REP_FILE=${1}
TARGET=${2}
DATA=${3}
RAND=${4}
TOP_N=${5}

#---------------------------------------------------------------
# run main loop

for REP in $(cat ${REP_FILE}); do

	# make rand target file
	python ./randomise_target.py \
		${TARGET} \
		${RAND}_${REP}_TARGET.csv

	# calc p-val list
	python ./pearsonR-PVAL.py \
		${RAND}_${REP}_TARGET.csv \
		${DATA} \
		${RAND}_${REP}_P_VAL.csv

	# getting top 5000 p-val
	tail -n +2 ${RAND}_${REP}_P_VAL.csv | sort -n | head -${TOP_N} > ${RAND}_${REP}_P_VAL_TOP.csv

	# log p-values
        python ./log.py \
        	${RAND}_${REP}_P_VAL_TOP.csv \
        	${RAND}_${REP}_P_VAL_TOP_LOG.csv

done

#---------------------------------------------------------------
# rm tmp files

#rm ${RAND}_${REP}_P_VAL.csv
rm ${RAND}_${REP}_P_VAL_TOP.csv

