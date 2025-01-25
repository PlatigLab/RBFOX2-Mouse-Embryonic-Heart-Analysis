# Purpose of this script is to figure out which of the selected TFs have motifs in JASPAR

# list of unique genes 
genes=("Adnp" "Creb3l1" "Deaf1" "Elk4" "Esrra" "Gata6" "Hic1" "Hmbox1" "Jun" "Max" "Maz" "Mef2a" "Nfic" "Nr2f2" "Nr2f6" "Nr4a1" "Nr6a1" "Nrf1" "Pbx3" "Pknox2" "Prdm16" "Rora" "Rreb1" "Smad5" "Sox4" "Stat6" "Tcf7l2")

output_file="../outputs/motif_ids.txt"
# Check if the output file exists, then remove it
if [ -f "$output_file" ]; then
    rm "$output_file"
fi

# loop through and figure out which TFs have motifs in JASPAR
for gene in "${genes[@]}"
do 
    echo $gene >> ../outputs/motif_ids.txt
    grep -i "$gene" ../../../../inputs/jaspar_motif_metadata/JASPAR2022_CORE_vertebrates_redundant_pfms_jaspar.txt >> $output_file

done

