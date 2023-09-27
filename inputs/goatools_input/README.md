# Inputs for `GOAtools`


📂 `mouse/`: 

Gene to Gene Ontology annotations for mouse.

📄 `mouse/gene_ontology_associations.pkl`:

File to be used with `GOAtools`.

Created using the following command: 

```
python make_gene_to_go_association_file.py mouse/mouse_annotations.tsv mouse/gene_ontology_associations.pkl
```

📄 `mouse/mouse_annotations.tsv`:

Created using the following command: 

```
# get file, uncompress, remove the header lines

wget -O - http://current.geneontology.org/annotations/mgi.gaf.gz | gzip -d | tail -n +37 > mouse_annotations.tsv

```

📄`make_gene_to_go_association_file.py`:

Simple script to convert the gene to `Gene Ontology` mapping file into a format compatiable with `GOAtools`. 

📄 `population.txt`

Generated with the following command: 

```
cut -f3 ./inputs/mouse_transcripts_genes_mapping/mm10_genes_and_transcripts.tsv | sort | uniq |  tr '[:upper:]' '[:lower:]' > ./inputs/goatools_input/population.txt
```
