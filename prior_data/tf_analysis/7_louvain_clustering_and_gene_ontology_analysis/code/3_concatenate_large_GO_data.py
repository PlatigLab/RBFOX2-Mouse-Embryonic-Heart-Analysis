"""
IMPORTANT: this script is only intended for running if the GO analysis results are too large to be concatenated in Jupyter notebooks. 
"""

import sys, glob
import pandas as pd

# list of dataframes that will be concatenated at the end
dataframe_concat_dfs = []
parameter_combination = sys.argv[1]

# for each iteration 
for iteration in range(1000): 

    # glob for files of each cluster in that parameter combination and iteration
    tmp_files = glob.glob(
        "/scratch/jve4pt/gene_ontology/differential_expression_networks/{}-iter_{}/*.tsv".format(parameter_combination, iteration)
    )
    
    assert len(tmp_files)>0
    
    # for each file (cluster)

    for file in tmp_files: 
        
        # get cluser id
        cluster = file.split("-")[-1].split(".")[0]

        # read dataframe
        df = pd.read_csv(file , sep="\t")
        
        # subset to uncorrected p value <0.05 and biological process
        df = df[(df["p_uncorrected"]<0.05) & (df["NS"]=="BP")]

        # if there are any rows left
        if df.index.size>0:
            
            # save cluster id, parameter combination, and iteration as columns
            df["Parameter_Combination"] = parameter_combination
            df["Iteration"] = iteration 
            df["Cluster"] = cluster

            # append to list of dataframes
            dataframe_concat_dfs.append(df)

# concatenate all dataframes
merged_df = pd.concat(dataframe_concat_dfs)

# output to file 
merged_df.to_csv(
    "/scratch/jve4pt/{}_merged_p_uncorrected_0.05.tsv.gz".format(parameter_combination), 
    sep="\t", 
    index=False, 
    compression="gzip"
)

