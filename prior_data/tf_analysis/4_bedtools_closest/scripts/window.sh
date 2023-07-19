# Purpose is to get those TFBS sites that are within 5000bp upstream of a gene or in gene body. 


for file in $(find ../../3_bedtools_intersect/outputs/ -type f )
do 

    # Get the TFBS sites that are within 5000bp upstream of a gene (stranded) or in gene body
    # pull out columns that are reference transcript, TF, relative score, and p value score (last 2 from JASPAR)
    # unique the lines to reduce size and redundant data
    gunzip -c $file | /home/jve4pt/.yogi_utils/bedtools-2.30.0/bedtools window -a /home/jve4pt/resource-files/genes/GENCODE_UCSC_browser/mm10_gencode_vm23_UCSC_browser.bed -b "stdin" -l 5000 -r 0 -sw | cut -f4,16,17,18 | uniq -u > ../outputs/$(basename $file .bed.gz).window_5000bp_upstream_stranded_abbreviated_info.tsv

done

# gzip compress all data 
gzip ../outputs/* 