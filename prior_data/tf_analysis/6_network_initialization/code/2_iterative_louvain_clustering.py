import pickle, sys, networkx
from gprofiler import GProfiler

# get file 
file = sys.argv[1]

# load pickled networkx object
network = pickle.load(open(file, 'rb'))

# parameter combination key 
parameter_combo = file.split("/")[-1].split(".")[0]

# store all iterative louvain clustering results 
gprofiler_dict = {}

# initialize dictionary for this parameter combination
gprofiler_dict[parameter_combo] = {}
    
# iterate over 100 random seeds
for iteration_count in range(100):
    
    # run louvain clustering with specific seed for reproducibility
    tmp = networkx.community.louvain_communities(network, seed=iteration_count)
    
    # initialize dictionary for this iteration
    gprofiler_dict[parameter_combo]["iter_{}".format(iteration_count)] = {}
    
    # get counter for cluster and the genes in that cluster
    for cluster_count, genes in enumerate(tmp):

        gp = GProfiler(return_dataframe=True)
        gprofiler_dict[parameter_combo]["iter_{}".format(iteration_count)]["cluster_{}".format(cluster_count)] = {}

        # save input genes 
        gprofiler_dict[parameter_combo]["iter_{}".format(iteration_count)]["cluster_{}".format(cluster_count)]["input"] = genes

        # run gProfiler Gene Ontology analysis
        gprofiler_dict[parameter_combo]["iter_{}".format(iteration_count)]["cluster_{}".format(cluster_count)]["results"] = gp.profile(organism='mmusculus', query=list(genes), no_evidences=False)

# pickle output
pickle.dump(
    gprofiler_dict, 
    open(
        "../../../../outputs/louvain_clustering/differential_expression_networks/output/{}.louvain_clustering_dictionary.pickle".format(parameter_combo), 
        "wb"
        )
    )

