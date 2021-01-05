# python2.7

import pandas as pd 
from sklearn.utils import shuffle 

import sys
INPUT = sys.argv[1]
OUTFILE = sys.argv[2]

# read in file
target = pd.read_csv(INPUT, header=0, index_col=0)

# shuffle
df = shuffle(target) 

# put original index on shuffed df
df.index=target.index

# write to file
df.to_csv(OUTFILE, index=True, header=True)

