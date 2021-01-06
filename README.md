# Random_simulator
All datasets contain a component of noise that will associate with a given set of data labels, known as false discovery. This package simulates the associations of features in a data matrix against random reshuffles of the data labels to generate a null distribution. This is useful for assessing how well the features associate with the actual labels compared to associations achieved under the expectation of random noise (false discovery). These scripts are designed to be run on the Spartan High Performance Compute at The University of Melbourne and can also be used on other systems with little modification. 

# There are five main scripts (and three helper scripts)

## actual.slurm  
##### Generates the top n log(10) p-values of the features against the actual labels using pearson correlation.  
``sbatch actual.slurm \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[target.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[data.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[top-n] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[outfile] \``  

##### arguments: 
``target.csv`` file of data labels  
``data.csv`` file of features  
``top-n`` number of top p-values to include in analysis  
``outfile`` name for outfile of actual log(10) p-values 

## random_simulator_runner.sh
Configures run parameters and launches the jobs for n replicates  
``sh random_simulator_runner.sh \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[target.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[data.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[start-rep] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[end-rep] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[top-n]`` 

##### arguments:  
``target.csv`` file of data labels  
``data.csv`` file of features  
``start-rep`` number of the starting replicate  
``end-rep`` number of the ending replicate  
``top-n`` number of top p-values to include in analysis  

## random_simulator.slurm
Generates the top n log(10) p-values of the features against random reshuffles of the labels using pearson correlation. This is run by ``random_simulator_runner.sh``.  
``sbatch random_simulator.slurm``

## random_simulator_combiner.sh
Combines the n many random simulations  
``sh random_simulator_combiner.sh \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[run_ID] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[outfile]``  

##### arguments:  
``[run_ID]`` specific prefix used for the run  
``[outfile]`` name for the combined random simulation log(10) p-values file  

## random_simulator_plotter.py
Generates a 2-dim histogram plot comparing the top n log(10) p-values of the features against random reshuffles of the actual labels against that obtained using the actual labels. This is best run on your local machine and not on Spartan.  
``python3 random_simulator_plotter.py \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[rand_sim_log_p-values.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[actual_log_p-values.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[main_title] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[title] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[x_label] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[y_label] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[bin_x_size]``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[bin_y_size]``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[outfile]``  

##### arguments:  
``[rand_sim_log_p-values.csv]`` file of top log(10) p-values from random simulations  
``[actual_log_p-values.csv]`` file of top log(10) p-values from actual labels  
``[main_title]`` main title of plot  
``[title]`` title of plot  
``[x_label]`` text for plot x label  
``[y_label]`` text for plot y label  
``[bin_x_size]`` x histogram bin size  
``[bin_y_size]`` y histogrambin size  
``[outfile]`` outfile name (Eg. plot.png)  

### Example
![Image description](https://github.com/abuultjens/Random_simulator/blob/main/33-ST17_1000-LOG.png)
In the above plot, the density of the top log(10) p-values obtained from random simulations is substantially larger than that obtained when the actual data labels are used. This suggests that the associations obtained with the actual labels are unlikely to be attributed to random noise in the dataset (non-false discovery).  
  
# Helper scripts

## randomise_target.py (helper script)  
Randomly reshuffles the data labels and generates an outfile  
``python3 randomise_target.py``  

## pearsonR-PVAL.py (helper script)  
Calculates the pearson correlation of the features against the labels file and generates an outfile  
``python3 pearsonR-PVAL.py``  

## log.py (helper script)  
Calculates the log(10) of the input p-values and generates an outfile  
``python3 log.py``  


