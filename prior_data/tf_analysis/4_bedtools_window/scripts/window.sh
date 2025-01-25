# Purpose is to get those TFBS sites that are within 5000bp upstream of a gene or in gene body. 
# Done using 'sbatch' to parallelize the process. 

bedtools="/project/PlatigLab/software/bedtools-v2.31.1/bin/bedtools"
ucsc_gene_file='../../../../inputs/resource_files/mm10_gencode_vm23_knownGene.bed'

for input_file in $(find ../../3_bedtools_intersect/outputs/ -type f )
do 
    # Wrap everything in an sbatch command line script to parallelize it
    # Get the TFBS sites that are within 5000bp upstream of a gene (stranded) or in gene body
    # pull out columns that are reference transcript, TF, relative score, and p value score (last 2 from JASPAR)
    # unique the lines to reduce size and redundant data
    sbatch --account="platiglab" --partition="parallel" -N 2 -n 4 --mem=30GB --output=$(basename $input_file .bed.gz)_output.txt --error=$(basename $input_file .bed.gz)_error.txt --wrap="gunzip -c ${input_file} | $bedtools window -a $ucsc_gene_file -b stdin -l 5000 -r 0 -sw | cut -f4,16,17,18 | sort | uniq > ../outputs/$(basename ${input_file} .bed.gz).window_5000bp_upstream_stranded_abbreviated_info.tsv"

done