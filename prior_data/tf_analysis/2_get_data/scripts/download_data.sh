# Purpose of this script is to download the proper motif scan files from JASPAR
# This is based on the motif IDs from the JASPAR database
# Chose these IDs based on which ones had the most data available
# (e.g. if the same TF had 2 separate files, the one with most data was chosen)

rm -f ../outputs/*

ids=("MA0839.1" "MA0076.2" "MA0592.3" "MA1104.2" "MA0739.1" "MA0895.1" "MA0489.2" "MA0058.3" "MA1522.1" "MA0052.4" "MA0161.2" "MA1111.1" "MA0677.1" "MA1112.2" "MA1541.1" "MA0506.2" "MA1114.1" "MA0783.1" "MA0072.1" "MA0073.1" "MA1557.1" "MA0867.2" "MA0520.1" "MA0523.1")

# for each file
# get and uncompress
for id in "${ids[@]}"
do 

    wget http://expdata.cmmt.ubc.ca/JASPAR/downloads/UCSC_tracks/2022/mm10/$id.tsv.gz
    gunzip -d $id.tsv.gz

done

mv *.tsv ../outputs