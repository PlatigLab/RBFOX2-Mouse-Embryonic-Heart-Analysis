# Transcription Factor Analysis 

Summaries for what each analysis folder does. 

📂 `1_available_motifs/`:

Figure out which TFs have available motifs in the `JASPAR 2022` database. 

📂 `2_get_data/`:

For the TFs with available motifs, download corresponding files that are motif analysis results genome-wide in mice. 

📂 `3_bedtools_intersect/`: 

Take files from above and `bedtools intersect` them with `refTSS v3.3 Transcription Start Sites` in order to find binding site hits that are near gene starts. 

This intersection is not meant to be exact as it looks upstream of each `TSS` for hits using the following 3 thresholds: `750`, `2.5kb` and `5kb` upstream of each TSS. 

📂 `4_bedtools_window/`: 

Take files from above and intersect them with `UCSC GENCODE vm23 track BED files` to annotate individual hits from above with gene names. 

📂 `5_transcripts_to_genes/`: 

Notebook analysis to convert transcript ids from above operation to gene ids. 

Also run some basic statistics/create figures. 

📂 `6_network_initialization/`: 

Notebooks to create network structures in `networkx` for downstream processing

📂 `7_louvain_clustering_and_gene_ontology_analysis/`: 

`Python` scripts to run `Louvain clustering` and `Gene Ontology` analysis for each parameter combination and iteration.

📄 `miscellaneous_analyses.ipynb`: 

This is meant for mini-analyses that do not fit cleanly into the normal workflow. 