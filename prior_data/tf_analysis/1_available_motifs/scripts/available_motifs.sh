# Purpose of this script is to figure out which of the selected TFs have motifs in JASPAR

# list of unique genes 
genes=("Adnp" "Atf7" "Creb3l1" "Cux1" "Deaf1" "Elk4" "Esrra" "Fiz1" "Gata6" "Hic1" "Hmbox1" "Jun" "Maz" "Mef2a" "Nfic" "Nr2f2" "Nr2f6" "Nr4a1" "Nr6a1" "Pbx3" "Pknox2" "Prdm16" "Rora" "Rreb1" "Smad1" "Sox4" "Stat6" "Tcf7l1" "Tcf7l2" "Zfat")

# loop through and figure out which TFs have motifs in JASPAR
for gene in "${genes[@]}"
do 
    echo $gene >> ../outputs/motif_ids.txt
    grep -i $gene ../../../../inputs/jaspar_motif_metadata/JASPAR2022_CORE_vertebrates_non-redundant_pfms_jaspar.txt >> ../outputs/motif_ids.txt

done