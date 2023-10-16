import os, glob

parameter_combinations = sorted(glob.glob("/home/jve4pt/RBFOX2-Mouse-Embryonic-Heart-Analysis/outputs/pickled_networks/differential_expression_tf_networks/*", recursive=True))

for parameter_combination in parameter_combinations:

    for iteration in range(1000): 

        output_file = "/scratch/jve4pt/SLURM/{}-iter_{}-output.txt".format(parameter_combination.split("/")[-1].split(".networkx")[0], iteration)
        error_file = "/scratch/jve4pt/SLURM/{}-iter_{}-error.txt".format(parameter_combination.split("/")[-1].split(".networkx")[0], iteration)

        os.system("sbatch --output='{}' --error='{}' --partition=standard --mem=8GB -N1 -n1 --wrap='/apps/software/standard/core/anaconda/2020.11-py3.8/bin/python /home/jve4pt/RBFOX2-Mouse-Embryonic-Heart-Analysis/prior_data/tf_analysis/7_louvain_clustering_and_gene_ontology_analysis/code/1_iterative_louvain_clustering_and_gene_ontology_analysis.py {} {}'".format(output_file, error_file, parameter_combination, iteration))