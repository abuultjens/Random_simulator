# Random_simulator
Simulates the associations of the features against random reshuffles of the target variable to generate a null distribution. This is useful for assessing how well the features associate with the actual labels compared to the expectation of random noise (make a false discovery assesment). These scripts are designed to be run on the Spartan High Performance Compute at The University of Melbourne. Thery can also be used on any other system with little modification. 

# There are five main scripts (and three helper scripts)

## ACTUAL.slurm
#### Generates the top n log(10) p-values of the features against the actual lables using pearson correlation.
``sbatch ACTUAL.slurm``

## random_simulator_runner.sh
#### Launches the jobs for n replicates
``sh random_simulator_runner.sh``

## random_simulator.slurm
#### Generates the top n log(10) p-values of the features against random reshuffles of the labels using pearson correlation.
``sbatch random_simulator.slurm``

## random_simulator_combiner.sh
#### Combines the n many random simulations
``sh random_simulator_combiner.sh``

## random_simulator_plotter.py
#### Generates a 2-dim histogram plot comparing the top n log(10) p-values of the features against random reshuffles of the actual labels against that obtained using the actual lables.
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


