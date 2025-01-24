import os, glob, sys
import urllib.request

urllib.request.urlretrieve(
    "https://purl.obolibrary.org/obo/go/go-basic.obo", 
    "go-basic.obo"
)

parameter_combinations = sorted(glob.glob("../../../../outputs/pickled_networks/differential_expression_tf_networks/*", recursive=True))

for parameter_combination in parameter_combinations:

    for iteration in range(1000): 

        output_file = "/scratch/jve4pt/SLURM/{}-iter_{}-output.txt".format(parameter_combination.split("/")[-1].split(".networkx")[0], iteration)
        error_file = "/scratch/jve4pt/SLURM/{}-iter_{}-error.txt".format(parameter_combination.split("/")[-1].split(".networkx")[0], iteration)

        os.system("sbatch --account=PlatigLab --output='{}' --error='{}' --partition=standard --mem=12GB -N1 -n2 --wrap='python3.11 ./1_iterative_louvain_clustering_and_gene_ontology_analysis.py {} {}'".format(output_file, error_file, parameter_combination, iteration))