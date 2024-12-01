#SUBSETTING GENE SEQUENCES FROM THE ASSEMBLY TO NEW FILE IN R

#Load library and folders
library(seqinr)
setwd("C:/Users/molen/Desktop/transcriptomics_analysis/annotation/Annotation_brain") 
list.files("C:/Users/molen/Desktop/transcriptomics_analysis/annotation/Annotation_brain") 

#Name the files: loads the assembly and and a list of genes of interest we want to extract to a new fasta
fastafile<-read.fasta(file="stringtie_brain_assembly_short.fa",seqtype="DNA",as.string=TRUE,set.attributes=FALSE) #assembly file 
subsetlist<-read.table(file="brain_DEG&DSG.txt",header=F) #list of genes of interest e.g. DEG or DSG
my_fasta_sub <- fastafile [names (fastafile) %in% subsetlist$V1] #subsets
write.fasta(sequences=my_fasta_sub,names=names(my_fasta_sub),file.out="brain_DEG&DSG_seq.fasta") #writes the sequences on a new file
