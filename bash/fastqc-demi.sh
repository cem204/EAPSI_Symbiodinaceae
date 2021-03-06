#!/bin/bash
#BSUB -J FastQC
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -o FastQC%J.out
#BSUB -e FastQC%J.err
#BSUB -n 8
#BSUB -u dxc947@miami.edu

#specify variable containing sequence file prefixes and directory paths
dcs="/scratch/projects/transcriptomics/demi"
coldir="/scratch/projects/transcriptomics/demi/sequences/EAPSI/"
exp="heat"
EAPSIsamples="Wt1-4a Wt1-4b Wt1-4c Wt1-6a Wt1-6b Wt1-6c Wt2-4a Wt2-4b Wt2-4c Wt2-6a Wt2-6b Wt2-6c Hw1-4a Hw1-4b Hw1-4c Hw1-6a Hw1-6b Hw1-6c Hw2-4a Hw2-4b Hw2-4c Hw2-6b Hw2-6c"

module load java/1.8.0_60
${dcs}/programs/FastQC/fastqc \
${coldir}/${exp}/zippedreads/[HW][wt][12]-[46][abc].txt.gz \
--outdir ${coldir}/${exp}/fastqcs/
