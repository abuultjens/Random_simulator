# Random_simulator
Simulates the associations of the features against random reshuffles of the target variable to generate a null distribution. This is useful for assessing how well the features associate with the actual labels compared to the expectation of random noise (make a false discovery assesment). 

# There are four scripts
``sbatch ACTUAL.slurm``
This generates the top n log(10) p-values of the features against the actual lables.

``sh random_simulator_runner.sh``
Launches the jobs for n replicates

``sbatch random_simulator.slurm``
Generates the top n log(10) p-values of the features against random reshuffles of the actual labels

``sh random_simulator_combiner.sh``
Combines the n many random simulations

``python3 random_simulator_plotter.py``
Generates a 2-dim histogram plot

