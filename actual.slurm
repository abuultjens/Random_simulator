#!/bin/bash


#SBATCH --time 00:20:00

##SBATCH -A punim0577
#SBATCH -A punim0927

#SBATCH -p physical
##SBATCH -p bigmem

#SBATCH --nodes=1
#SBATCH --ntasks=1

#SBATCH --mem 50G


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


###############################################################




###############################################################

TARGET=${1}
DATA=${2}
OUTFILE=${3}

# calc p-val list
python /home/abuultjens/scripts/pearsonR-PVAL.py \
	${TARGET} \
	${DATA} \
	ACTUAL_P_VAL.csv

# getting top 5000 p-val
tail -n +2 ACTUAL_P_VAL.csv | sort -n | head -5000 > ACTUAL_P_VAL_TOP.csv

# log p-values
python log.py \
	ACTUAL_P_VAL_TOP.csv \
	${OUTFILE}
	
rm ACTUAL_P_VAL_TOP.csv





