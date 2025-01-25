📃 `mm10_gencode_vm23_knownGene.bed`:

`BED` file of genes for `mm10` gneome derived from `UCSC Genome Browser` [Table Browser](https://genome.ucsc.edu/cgi-bin/hgTables).

File filtered using the following `grep` commands: 
```
grep -v "_fix" | grep -v "_alt" | grep -v "_random" | grep -v "chrUn_"

```

📃 `mm10.chrom.sizes`: 

```
wget https://hgdownload.cse.ucsc.edu/goldenpath/mm10/bigZips/mm10.chrom.sizes
```

📃 `refTSS_v3.3_mouse_coordinate.mm10.bed`: 

Contains [refTSS](https://doi.org/10.1016/j.jmb.2019.04.045) mouse [v3.3](https://reftss.riken.jp/datafiles/3.3/mouse/) `TSS` coordinates in `mm10` genome assembly.

```
wget https://reftss.riken.jp/datafiles/3.3/mouse/refTSS_v3.3_mouse_coordinate.mm10.bed.gz && gunzip -c * 
```