# Purpose of this script is to download the proper motif scan files from JASPAR
# This is based on the motif IDs from the JASPAR database
# Chose these IDs based on which ones had the most data available
# (e.g. if the same TF had 2 separate files, the one with most data was chosen)

ids=("MA0834.1" "MA0839.1" "MA0754.2" "MA0076.2" "MA0592.3" "MA1104.2" "MA0739.1" "MA0895.1" "MA0488.1" "MA1522.1" "MA0052.4" "MA0161.2" "MA1111.1" "MA0677.1" "MA1112.2" "MA1541.1" "MA1114.1" "MA0783.1" "MA0071.1" "MA0073.1" "MA0867.2" "MA0520.1" "MA1421.1" "MA0523.1")

# for each file
# get and uncompress
for id in "${ids[@]}"
do 

    wget http://expdata.cmmt.ubc.ca/JASPAR/downloads/UCSC_tracks/2022/mm10/$id.tsv.gz
    gunzip -d $id.tsv.gz

done

mv *.tsv ../outputs