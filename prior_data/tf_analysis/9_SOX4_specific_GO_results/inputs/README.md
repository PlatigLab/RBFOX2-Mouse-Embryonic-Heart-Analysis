# Inputs for `Sox4` Specific Analyses

📄 `hg38_Oth.ALL.05.SOX4.AllCell.bed`

This file is derived from `ChIP-Atlas` 2022 version. 

It is a `BED` file download from the "Peak Browser" where the `hg38` genome is chosen and taking all peaks from `Sox4` experiments. 

The first line which was an `IGV` track header has been removed. 

📄 `hg38_rbfox2.bed`

UCSC Genome Browser coordinates for the "main" isoform for `hg38`. 

📄 `mm10_Oth.ALL.05.Sox4.AllCell.bed`

Same as `hg38` but for `mm10` genome. 

The first line which was an `IGV` track header has been removed. 

📄 `mm10_rbfox2.bed`

UCSC Genome Browser coordinates for the "main" isoform for `mm10`. 

📄 `remap2022_SOX4_all_macs2_hg38_v1_0.bed`

`hg38` version of `SOX4` binding according to `ReMap 2022`. 

Created with: 

```
wget "https://remap.univ-amu.fr/storage/remap2022/hg38/MACS2/TF/SOX4/remap2022_SOX4_all_macs2_hg38_v1_0.bed.gz" | gzip -d 
```

📄 `remap2022_SOX4_all_macs2_mm10_v1_0.bed`

`mm10` version of `SOX4` binding according to `ReMap 2022`. 

Created with: 

```
wget "https://remap.univ-amu.fr/storage/remap2022/hg38/MACS2/TF/SOX4/remap2022_SOX4_all_macs2_mm10_v1_0.bed.gz" | gzip -d 
```