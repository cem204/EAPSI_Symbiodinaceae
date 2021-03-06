#!/bin/bash
#BSUB -J STARfC_symC1
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -o STARfC_symC1%J.out
#BSUB -e STARfC_symC1%J.err
#BSUB -n 8
#BSUB -u m.connelly1@umiami.edu

#specify variable containing sequence file prefixes and directory paths
mcs="/scratch/projects/transcriptomics/mikeconnelly"
prodir="/scratch/projects/transcriptomics/mikeconnelly/projects/EAPSI_Symbiodinaceae"
EAPSIsamples="Wt1-1a Wt1-1b Wt1-1c Wt1-4a Wt1-4b Wt1-4c Wt1-5a Wt1-5b Wt1-5c Wt1-6a Wt1-6b Wt1-6c Wt2-1a Wt2-1b Wt2-1c Wt2-4a Wt2-4b Wt2-4c Wt2-5a Wt2-5b Wt2-5c Wt2-6a Wt2-6b Wt2-6c Hw1-1a Hw1-1b Hw1-1c Hw1-4a Hw1-4b Hw1-4c Hw1-5a Hw1-5b Hw1-5c Hw1-6a Hw1-6b Hw1-6c Hw2-1a Hw2-1b Hw2-1c Hw2-4a Hw2-4b Hw2-4c Hw2-5a Hw2-5b Hw2-5c Hw2-6b Hw2-6c"

echo "These are the .bam files to be quantified using featureCounts"
echo $EAPSIsamples
${dcs}/programs/subread-1.6.0-Linux-x86_64/bin/featureCounts -t gene \
-g ID \
-a ${dcs}/sequences/genomes/symbiodinium/symC1_genome.gff \
-o ${coldir}/${exp}/STARcounts_SymC1/${exp}_SymC1.counts \
${coldir}/${exp}/STARalign_SymC1/*Aligned.out.bam
