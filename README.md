# Random_simulator
Simulates the associations of the features in a data matrix against random reshuffles of the data labels to generate a null distribution. This is useful for assessing how well the features associate with the actual labels compared to associations achieved under the expectation of random noise (false discovery assesment). These scripts are designed to be run on the Spartan High Performance Compute at The University of Melbourne and can also be used on other systems with little modification. 

# There are five main scripts (and three helper scripts)

## ACTUAL.slurm
##### Generates the top n log(10) p-values of the features against the actual lables using pearson correlation.
``sbatch ACTUAL.slurm``

## random_simulator_runner.sh
Launches the jobs for n replicates  
``sh random_simulator_runner.sh [target.csv] [data.csv] [start-rep] [end-rep] [top-n]``  
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
``sh random_simulator_combiner.sh [run_ID] [outfile]``  

## random_simulator_plotter.py
Generates a 2-dim histogram plot comparing the top n log(10) p-values of the features against random reshuffles of the actual labels against that obtained using the actual lables.  
``python3 random_simulator_plotter.py``  

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


