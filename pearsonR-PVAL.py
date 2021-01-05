# python2.7

# calculate the pearson R for each feature

# script.py [TARGET] [DATA] [OUTFILE]

#--------------------------------------------

import sys
TARGET = sys.argv[1]
DATA = sys.argv[2]
OUTFILE = sys.argv[3]


import numpy as np
import pandas as pd
from scipy.stats.stats import pearsonr

target = pd.read_csv( TARGET, header=0, index_col=0)
data_tr = pd.read_csv( DATA, header=0, index_col=0)
data = data_tr.transpose()

array = []
for i in data.columns:
        BIT = pearsonr(data[i], target[target.columns[0]])[1]
#        print(pearsonr(data[i], target[target.columns[0]]))
        array.append(BIT)

# test
#np.savetxt('savetxt_array.csv', array, delimiter=",", fmt="%s")
        
# make head array
head_array = ["pearsonR"]

# make df
array_df = pd.DataFrame(data=array, columns=head_array)
        
# write pearsonR to file
array_df.to_csv(OUTFILE, index=False, na_rep="nan")

