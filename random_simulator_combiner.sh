#!/bin/bash

#-------------------------------------------------------------

# sh random_simulator_combiner.sh [RUN_ID] [OUTFILE]

#-------------------------------------------------------------

paste ${1}_*_P_VAL_TOP_LOG.csv | tr '\t' ',' > ${2}
