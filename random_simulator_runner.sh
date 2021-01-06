#!/bin/bash

###############################################################

TARGET=${1}
DATA=${2}
START_REP=${3}
END_REP=${4}
TOP_N=${5}

###############################################################

# generate random prefix for all tmp files
RAND_1=`echo $((1 + RANDOM % 100))`
RAND_2=`echo $((100 + RANDOM % 200))`
RAND_3=`echo $((200 + RANDOM % 300))`
RAND=`echo "${RAND_1}${RAND_2}${RAND_3}"`

# make sequence file
seq ${START_REP} ${END_REP} > ${RAND}_SEQ.txt

# split seq file into single fofns with one rep each
split -d -l 1 ${RAND}_SEQ.txt ${RAND}_FOFN_

# make list of all single fofn files
ls ${RAND}_FOFN_* > ${RAND}_FOFN_LIST.txt

# submit slurm jobs for each single rep
for RUN in $(cat ${RAND}_FOFN_LIST.txt); do
	sbatch random_simulator.slurm ${RUN} ${TARGET} ${DATA} ${RAND} ${TOP_N} &
done




