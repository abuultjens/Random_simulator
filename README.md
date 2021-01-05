# Random_simulator
Simulates the associations of the features in a data matrix against random reshuffles of the data labels to generate a null distribution. This is useful for assessing how well the features associate with the actual labels compared to associations achieved under the expectation of random noise (false discovery assesment). These scripts are designed to be run on the Spartan High Performance Compute at The University of Melbourne and can also be used on other systems with little modification. 

# There are five main scripts (and three helper scripts)

## ACTUAL.slurm
##### Generates the top n log(10) p-values of the features against the actual lables using pearson correlation.
``sbatch ACTUAL.slurm``

## random_simulator_runner.sh
Configures run parameters and launches the jobs for n replicates  
``sh random_simulator_runner.sh \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[target.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``  [data.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``  [start-rep] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``  [end-rep] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``  [top-n]`` 

##### arguments:  
``target.csv`` file of data labels  
``data.csv`` file of features  
``start-rep`` number of the starting replicate  
``end-rep`` number of the ending replicate  
``top-n`` number of top p-values to include in analysis  


## random_simulator.slurm
Generates the top n log(10) p-values of the features against random reshuffles of the labels using pearson correlation.  
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
Generates a 2-dim histogram plot comparing the top n log(10) p-values of the features against random reshuffles of the actual labels against that obtained using the actual lables.  
``python3 random_simulator_plotter.py \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[rand_sim_log_p-values.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[actual_log_p-values.csv] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[main_title] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[title] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[x_label] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[y_label] \``  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;``[outfile]``  

##### arguments:  
``[rand_sim_log_p-values.csv]`` file of top log(10) p-values from random simulations  
``[actual_log_p-values.csv]`` file of top log(10) p-values from actual labels  
``[main_title]`` main title of plot  
``[title]`` title of plot  
``[x_label]`` text for plot x label  
``[y_label]`` text for plot y label  
``[outfile]`` outfile name  
  
# Helper scripts

## randomise_target.py (helper script)
####
``python3 randomise_target.py``

## pearsonR-PVAL.py (helper script)
### 
``python3 pearsonR-PVAL.py``

## log.py (helper script)
###
``python3 log.py``


