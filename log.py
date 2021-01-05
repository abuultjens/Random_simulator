# python2.7

import numpy as np
import pandas as pd

import sys                                       
INPUT = sys.argv[1]
OUTFILE = sys.argv[2]

# read in file
data_tr = pd.read_csv(INPUT, header=None, index_col=None)
data = data_tr.transpose()

# log
data_tr_log = np.log10(data_tr)

# write to file
data_tr_log.to_csv(OUTFILE, index=False, header=False)


