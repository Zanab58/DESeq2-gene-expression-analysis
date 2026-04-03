# DESeq2 Differential Gene Expression Analysis
This script performs differential gene expression (DGE) analysis 
using DESeq2 on RNA-seq count data in R.

# What this analysis does
- Loads RNA-seq count matrix and sample metadata
- Normalizes data using rlog transformation
- Visualizes sample clustering using PCA
- Identifies differentially expressed genes between normal and disease samples

# Libraries used
- DESeq2, apeglm (Bioconductor)
- ggplot2, pheatmap, RColorBrewer, gridExtra, dplyr (CRAN)

# Input files required
- counts.tsv — raw gene count matrix
- metadata.tsv — sample information and condition labels

# Course
MS Bioinformatics, Semester 1 — NUST, Pakistan
