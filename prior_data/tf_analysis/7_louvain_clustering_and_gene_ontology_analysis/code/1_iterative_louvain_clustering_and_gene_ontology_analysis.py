import pickle, sys
from networkx.algorithms.community import louvain_communities
from goatools.obo_parser import GODag
from goatools.goea.go_enrichment_ns import GOEnrichmentStudyNS
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))

file = sys.argv[1]

iteration = sys.argv[2]

# load pickled networkx object
network = pickle.load(open(file, 'rb'))

# parameter combination key 
parameter_combo = file.split("/")[-1].split(".")[0]

# file for gene ontology associations
associations = pickle.load(open("../../../../inputs/goatools_input/mouse/gene_ontology_associations.pkl", 'rb'))

# file for population (protein-coding genes)
protein_coding_genes = []

with open("../../../../inputs/goatools_input/population.txt", 'r') as in_file: 
    for line in in_file: 
        protein_coding_genes.append(line.strip("\n"))

clustering = louvain_communities(network, seed=int(iteration))

# make directories for louvain clustering and future gene ontology analysis
os.makedirs("/scratch/jve4pt/louvain_clustering/differential_expression_networks/{}/".format(parameter_combo), exist_ok=True)
os.makedirs("/scratch/jve4pt/gene_ontology/differential_expression_networks/{}-iter_{}/".format(parameter_combo, iteration), exist_ok=True)

# output clustering modules
pickle.dump(clustering, open("/scratch/jve4pt/louvain_clustering/differential_expression_networks/{}/{}-iter_{}.pkl".format(parameter_combo, parameter_combo, iteration), 'wb'))

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
    methods = ["fdr_bh"]
)

for count, genes in enumerate(clustering):

    # run analysis
    results = enrichment_analysis_obj.run_study(genes)
    
    enrichment_analysis_obj.wr_tsv(
        "/scratch/jve4pt/gene_ontology/differential_expression_networks/{}-iter_{}/{}-iter_{}-cluster_{}.tsv".format(parameter_combo, iteration, parameter_combo, iteration, count), 
        results
    )