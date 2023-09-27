import pickle, sys, networkx
from goatools.obo_parser import GODag
from goatools.goea.go_enrichment_ns import GOEnrichmentStudyNS
import os

os.chdir("/home/jve4pt/RBFOX2-Mouse-Embryonic-Heart-Analysis/prior_data/tf_analysis/7_iterative_louvain_clustering/code/")

file = sys.argv[1]

iteration = sys.argv[2]

# load pickled networkx object
network = pickle.load(open(file, 'rb'))

# parameter combination key 
parameter_combo = file.split("/")[-1].split(".")[0]

# file for gene ontology associations
associations = pickle.load(open("/home/jve4pt/resource-files/gene_ontology/mouse/gene_ontology_associations.pkl", 'rb'))

# file for population (protein-coding genes)
protein_coding_genes = []

with open("/home/jve4pt/RBFOX2-Mouse-Embryonic-Heart-Analysis/inputs/goatools_input/population.txt", 'r') as in_file: 
    for line in in_file: 
        protein_coding_genes.append(line.strip("\n"))

# run louvain clustering with specific seed for reproducibility
clustering = networkx.community.louvain_communities(network, seed=int(iteration))

# make directories for louvain clustering and future gene ontology analysis
os.makedirs("/home/jve4pt/RBFOX2-Mouse-Embryonic-Heart-Analysis/outputs/louvain_clustering/{}".format(parameter_combo), exist_ok=True)
os.makedirs("/home/jve4pt/RBFOX2-Mouse-Embryonic-Heart-Analysis/outputs/gene_ontology_analysis/differential_expression_networks/output/{}-iter_{}/".format(parameter_combo, iteration), exist_ok=True)

# output clustering modules
pickle.dump(clustering, open("/home/jve4pt/RBFOX2-Mouse-Embryonic-Heart-Analysis/outputs/louvain_clustering/{}/{}-iter_{}.pkl".format(parameter_combo, parameter_combo, iteration), 'wb'))

# for each cluster
# run Gene Ontology analysis

go_results_dict = {}

# initialize object with population, associations, and GO DAG
enrichment_analysis_obj = GOEnrichmentStudyNS(
    
    protein_coding_genes,
    associations, 
    GODag("go-basic.obo"), 

    # not propagating counts to parents of GO terms 
    propagate_counts = False, 
    alpha = 0.1, 
    methods = ["fdr_bh"]

)

for count, genes in enumerate(clustering):

    # run analysis
    results = enrichment_analysis_obj.run_study(genes)

    # filter for significant results
    results = [r for r in results if r.p_fdr_bh < 0.1]
    
    enrichment_analysis_obj.wr_tsv(
        "/home/jve4pt/RBFOX2-Mouse-Embryonic-Heart-Analysis/outputs/gene_ontology_analysis/differential_expression_networks/output/{}-iter_{}/{}-iter_{}-cluster_{}.tsv".format(parameter_combo, iteration, parameter_combo, iteration, count), 
        results
    )