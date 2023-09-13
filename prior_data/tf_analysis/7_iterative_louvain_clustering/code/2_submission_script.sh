# !/bin/bash

for file in $(find "../../../../outputs/differential_expression_tf_networks/" -type f | sort)
do 
   sbatch --output="../../../../outputs/louvain_clustering/differential_expression_networks/SLURM/$(basename $file.output.txt)" --error="../../../../outputs/louvain_clustering/differential_expression_networks/SLURM/$(basename $file.error.txt)" --partition=standard --mem=30G -N1 -n1 --wrap="/apps/software/standard/core/anaconda/2020.11-py3.8/bin/python 2_iterative_louvain_clustering.py $file"
done

