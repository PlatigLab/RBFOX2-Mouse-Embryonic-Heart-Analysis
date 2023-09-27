import pandas as pd
import sys, pickle

input_file = sys.argv[1]
output_file = sys.argv[2]

df = pd.read_csv(input_file, sep="\t", header=None)

df[2] = df[2].str.lower()

df = df[df[2].notna()]

df[8] = df[8].map({"P": "BP", "F": "MF", "C": "CC"})

associations_dict = {}

for category in df[8].unique().tolist():

    print(category)

    tmp_df = df[df[8]==category]

    associations_dict[category] = {}

    for gene in tmp_df[2].unique().tolist():


        associations_dict[category][gene.lower()] = set(tmp_df[tmp_df[2]==gene][4].unique())

pickle.dump(associations_dict, open(output_file, "wb"))