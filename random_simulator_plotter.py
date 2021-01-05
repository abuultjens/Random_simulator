
# libraries
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

import sys
SIM_DATA = sys.argv[1]
ACTUAL_DATA = sys.argv[2]
MAIN_TITLE = sys.argv[3]
TITLE = sys.argv[4]
XLABEL = sys.argv[5]
YLABEL = sys.argv[6]
OUTFILE = sys.argv[7]

data_tr = pd.read_csv(SIM_DATA, header=None, index_col=None)
data = data_tr.transpose()

# melt data from wide to long 
data_melt = data.melt()
x = data_melt['variable'].values.ravel()
y = data_melt['value'].values.ravel()

# make plot with scale
plt.hist2d(x, y, (40, 40), cmap=plt.cm.jet)
plt.colorbar()
actual = pd.read_csv(ACTUAL_DATA, header=0, index_col=None)
plt.plot(actual, color='white', linestyle='dashed')
plt.suptitle(MAIN_TITLE, fontsize=18)
plt.title(TITLE, fontsize=14)
plt.xlabel(XLABEL, fontsize=18)
plt.ylabel(YLABEL, fontsize=18)
#plt.show()
plt.savefig(OUTFILE)




