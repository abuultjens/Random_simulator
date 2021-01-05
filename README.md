# Random_simulator
Simulates the associations of the features against random reshuffles of the target variable to generate a null distribution. This is useful for assessing how well the features associate with the actual labels compared to the expectation of random noise (make a false discovery assesment). These scripts are designed to be run on the Spartan High Performance Compute at The University of Melbourne. Thery can also be used on any other system with little modification. 

# There are four scripts

# ACTUAL.slurm
``sbatch ACTUAL.slurm``
Generates the top n log(10) p-values of the features against the actual lables.

# random_simulator_runner.sh
``sh random_simulator_runner.sh``
Launches the jobs for n replicates

# random_simulator.slurm
``sbatch random_simulator.slurm``
Generates the top n log(10) p-values of the features against random reshuffles of the actual labels

# random_simulator_combiner.sh
``sh random_simulator_combiner.sh``
Combines the n many random simulations

# random_simulator_plotter.py
``python3 random_simulator_plotter.py``
Generates a 2-dim histogram plot

