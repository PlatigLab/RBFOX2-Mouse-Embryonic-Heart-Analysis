# Purpose is to extend refTSS files around promoters using hyperparameters suggested by John Platig and then intersect that with JASPAR TFBS data.  

ids=("MA0834.1" "MA0839.1" "MA0754.2" "MA0076.2" "MA0592.3" "MA1104.2" "MA0739.1" "MA0895.1" "MA0488.1" "MA1522.1" "MA0052.4" "MA0161.2" "MA1111.1" "MA0677.1" "MA1112.2" "MA1541.1" "MA1114.1" "MA0783.1" "MA0071.1" "MA0073.1" "MA0867.2" "MA0520.1" "MA1421.1" "MA0523.1")
upstream_parameters=(750 2500 5000)

# for each file
# for each upstream parameter 
# slop refTSS file based on upstream parameter
# intersect the "slop" results with JASPAR motif ID file data

for id in "${ids[@]}"
do 

    for upstream_param in "${upstream_parameters[@]}"
    do 

        final_file="../outputs/$id.upstream_$upstream_param.bed"
        /home/jve4pt/.yogi_utils/bedtools-2.30.0/bedtools slop -i ~/resource-files/tss/mm10_refTSS_v3.3_UCSC_browser.bed -g ~/resource-files/chrom_sizes/mm10.chrom.sizes -l $upstream_param -r 250 -s | /home/jve4pt/.yogi_utils/bedtools-2.30.0/bedtools intersect -a ../../2_get_data/outputs/$id.tsv -b "stdin" -wa -wb > $final_file 

    done

done

# gunzip compress all the output files from above 
gzip ../outputs/*