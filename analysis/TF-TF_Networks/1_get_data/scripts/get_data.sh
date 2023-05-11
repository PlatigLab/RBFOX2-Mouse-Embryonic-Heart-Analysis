###################
# ENCODE RNA-Seq ##
###################

# not so great data 
wget https://www.encodeproject.org/files/ENCFF130ASQ/@@download/ENCFF130ASQ.tsv -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/ENCSR000CHF/ENCFF130ASQ_gene_quantifications.tsv
wget https://www.encodeproject.org/files/ENCFF926IIV/@@download/ENCFF926IIV.tsv -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/ENCSR000CHF/ENCFF926IIV_gene_quantifications.tsv

# better data 
wget https://www.encodeproject.org/files/ENCFF540BJT/@@download/ENCFF540BJT.tsv -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/ENCSR727FHP/ENCFF540BJT_gene_quantifications.tsv
wget https://www.encodeproject.org/files/ENCFF111IGW/@@download/ENCFF111IGW.tsv -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/ENCSR727FHP/ENCFF111IGW_gene_quantifications.tsv

###################
# Cardiomyocytes ##
###################
prefetch -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/cardiomyocytes/ SRR17750892 SRR17750893 
fasterq-dump --progress --threads 15 --split-files -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/cardiomyocytes/SRR17750892/ /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/cardiomyocytes/SRR17750892
fasterq-dump --progress --threads 15 --split-files -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/cardiomyocytes/SRR17750893/ /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/cardiomyocytes/SRR17750893

###################
# Cardiomyocytes ##
###################
prefetch -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/RA_myocardium_and_pacemaker_sinoatrial_node/ SRR21543720 SRR21543721 SRR21543722 
fasterq-dump --progress --threads 15 --split-files -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/RA_myocardium_and_pacemaker_sinoatrial_node/SRR21543720/ /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/RA_myocardium_and_pacemaker_sinoatrial_node/SRR21543720
fasterq-dump --progress --threads 15 --split-files -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/RA_myocardium_and_pacemaker_sinoatrial_node/SRR21543721/ /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/RA_myocardium_and_pacemaker_sinoatrial_node/SRR21543721
fasterq-dump --progress --threads 15 --split-files -O /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/RA_myocardium_and_pacemaker_sinoatrial_node/SRR21543722/ /project/PlatigLab/interactome_construction/mouse_embryonic_E14.5_heart/bulk_RNA/RA_myocardium_and_pacemaker_sinoatrial_node/SRR21543722






