#intsall libraries Base R libraries
install.packages("ggplot2")
install.packages("pheatmap")
install.packages("RColorBrewer")
install.packages("gridExtra")
install.packages("BiocManager")
install.packages("stringi")
install.packages("dplyr")

#Bioconductor libraries:
BiocManager::install("SummarizedExperiment")
BiocManager::install("DESeq2")
BiocManager::install("EnhancedVolcano")
BiocManager::install("apeglm")

#Loading the libraries
library("DESeq2")
library("EnhancedVolcano")
library("ggplot2")
library("pheatmap")
library("dplyr")
library("apeglm")
library("RColorBrewer")

# Set working directory using GUI (Session > Set Working Directory)
getwd()  # confirm it is set correctly
#Read Metadata
metadata <- read.delim("metadata.tsv")
#gene raw counts
counts <- read.delim("counts.tsv")
#Analysis
# Ensure counts columns match metadata rows
all(colnames(counts) == rownames(metadata))
#Create DESeq2 Object
dds = DESeqDataSetFromMatrix(counts,metadata,~type)
#Preprocessing:
rld <-rlog(dds)
#visualize
head(assay(rld))
# PCA 
plotPCA(rld, intgroup = c("type"))
#Perform DGE analysis
# reference phenotype.
dds$type <- relevel(dds$type, "normal")
#Run DESeq2
dds <- DESeq(dds)
#Sanity check
resultsNames(dds)
#Build results table
res <- results(dds)
#Exploring the results
mcols(res, use.names=TRUE)
