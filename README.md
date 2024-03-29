NOTE：THIS IS A TEMPORARY INTRODUTION TO THIS REPOSITORY

# Table of Contents
1. [INTRODUCTION](#introduction)
2. [PREREQUISITES](#prerequisites)
3. [METHODS AND PRE-PROCESSING](#methods-and-pre-processing)
4. [USAGE](#usage)  
    4.1 [RUNNING A WHOLE PIPELINE](#running-a-whold-pipeline)  
    4.2 [RUNNING PART OF PPL](#running-part-of-ppl)  
5. [EXTRACT ALLELE FREQUENCY](#extract-allele-frequency)

# INTRODUCTION 
PPL is an optimized and integrated pipeline that conducts many steps of analyses within the manuscript instead of raw scripts, which have poor versatility.. PPL integrated five main functions, including:  
1. Calling variations from a bam file and generating five txt files with 'A', 'T', 'C', 'G', 'coverage' suffixes, respectively ("--pileup" or "-p");  
2. Merging all the 'A', 'T', 'C', 'G', 'coverage' txt files in a directory to five files with ".gz" format for the following rds generation ("--merge" or "-m");  
3. Generating rds file for downstream analysis from a directory containing merged 'A', 'T', 'C', 'G', 'coverage' txt files. ("--generate-rds" or "-r");  
4. Splitting a big sam file to several parts based on the cell barcodes and their corresponding cell type annotations("--split-sam");  
5. Merging 'A', 'T', 'C', 'G', 'coverage' txt files of the same cell type according to user's cell annotations("--mergesamecell").  

Raw codes within the "source_code" directory were shared for possible use  and we also provide a R script for generating t-SNE visualization and hierarchical clustering plots within the "Script" directory.  

# PREREQUISITES

- Python2  
- pysam  
  - NOTE：PPL uses scripts in [https://github.com/sankaranlab/mito-genotyping](https://github.com/sankaranlab/mito-genotyping) to call variations and generate rds files   
- Python3   
- R   
- Samtools   

# METHODS AND PRE-PROCESSING

## 1. For 10x data:

We applied the default cell-ranger pipeline and transferred the out bam file to sam using samtools (version 1.9).

```
cellranger count --id={OUTDIR} --transcriptome={GENOME_PATH} --fastqs={INPUT_FASTQ_PATH} --expect-cells={EXCEPT_CELLS} --localcores={RUNNING_CORE_NUMBERS}
samtools view -h -o {OUT_SAM} {CELLRANGER_OUT_BAM}
```

For the pipeline in the manuscript, the genome was GRCH38, except_cells was set to 10000.   

Then we used perl scripts to split sam files because cells annotated as the same cell types were processed together as one sample. For example(id = 97):

```
cd ./97/outs/
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_III_DMSO_36_1 ../../../GSE142465_Human3_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
```

The bam file of the last calling variation is generated from the sam file containing only MtDNA readings generated in the previous step.

This step can be performed using PPL with --split-sam10x option to generate bam files and the corresponding file list. You can also run the complete pipeline with -p -m -r options.

## 2. For smart-seq2 data:

The clean fastq files were processed as follows:

```
STAR --runThreadN {RUNNING_THREADS_NUMBER} --genomeDir {GENOME_PATH} --outFileNamePrefix {PREFIX} --sjdbGTFfile {GTF} --outSAMunmapped Within --readFilesIn {FASTQ1} {FASTQ2}
samtools view -bS {STAR_OUT_SAM} > {OUT_BAM}
samtools sort  {INPUT_BAM} -o {OUT_SORTED_BAM}
samtools view -h {INPUT_SORTED_BAM} {REGION} > {FINAL_SAM}
samtools view -bS {FINAL_SAM} >{FINAL_BAM}
```

For the pipeline in the manuscript, the genome and corresponding gtf file was GRCH38(The genome and gtf files used in this article are both GRCH38）

## 3. For inDrops data:

Raw fastq reads were processed according to the custom inDrops pipelines [www.github.com/indrops/indrops](www.github.com/indrops/indrops) using Trimmomatic to trim reads, Bowtie 1.2.3 to map reads to the reference transcriptome and the meters as in the default_parameter YAML file.

```
python2 indrops.py {YAML} build_index --genome-fasta-gz {GENOME_PATH} --ensembl-gtf-gz {GTF}
python2 indrops.py {PROJECT_YAML} filter
python2 indrops.py {PROJECT_YAML} identify_abundant_barcodes
python2 indrops.py {PROJECT_YAML} sort
python2 indrops.py {PROJECT_YAML} quantify
```
The bam file obtained through the indrops process will be used for sort and call mutations. Since the coverage of indrops data is relatively low, we merged the mutation files of the same cell types. This step can be done through PPL, and will merge the files according to the user's cell annotations.

# USAGE

As is described above, PPL has five main functions resulting different inputs and outputs. User can run a single module in the PPL or combine many of them to reach their purposes. Note that except onlying runing PPL with option "--merge"(-m) or "--generate-rds"(-r), PPL will automatically created a directory which path is specified by "--outdir"/"--name". All the outputs will under that directory.

User can find examples for input and output in the "ppl/Examples" dircetory.

To use the PPL easier, users can just download the whole repository and copy it to the work directory. 

NOTE:  
Ensure samtools is in your PATH or you will need to run the following commands:  
export PATH="${PATH}:/your_samtools/installed/path/ "  
It is suggested that the command is added to the .bashrc  


# RUNNING A WHOLE PIPELINE

Users can run the whole pipeline of PPL by specifying different options. For example, is this article, when dealing with 10x data, we can generate the rds file directly by using options "--split-sam -p -m -r". The input depends on the priority listed below:  
  
Here are examples of running whole pipelines in three different situations:  
  
(i) Splitting a big sam file into several smaller sam files, and the number of generated sam files are the same as the number of cell types; call variations; merging all the mutation files in the directory; generating rds file:  
  
Input is a file list:  
```
python ppl/ppl2_run.py -t 10 --split-sam --input-filelist -p -m -r --name ppl10x --input 10x_list
```
Input is a single sam file:
```
python ppl/ppl2_run.py -t 10 --split-sam -p -m -r --name ppl10xsingle --input genome10x_98.sam --split-annotation human_cutted.tsv --outprefix ppl10xout
```
Note:   
1 Annotation files must be in csv format:  
AAACCTGAGAATCTCC-9,Alpha  
AAACCTGAGAATGTTG-7,Alpha  
AAACCTGAGAGGACGG-6,Ductal  
AAACCTGAGCACCGTC-7,Alpha  
AAACCTGAGCCATCGC-1,Alpha  

2 Input file list must be in csv format with three column (file name, out prefix, annotation file):  
genome10x_98.sam,genome10x_98,human_cutted.csv  
genome10x_99.sam,genome10x_99,human_cutted.csv  

3 Inputted sam file must be tagged with "CB:Z:" for reads barcodes (sam file contain the "CB:Z:" column ):  
CB:Z:GTAACTGCAGGGTATG-1  
CB:Z:GGGACCTAGCGAAGGG-1  

(ii) Call variations, merge mutation files with same cell type, merge all the mutation files in the directory, generate rds file:  

```
python ppl/ppl2_run.py -t 10 --mergesamecell --input-filelist -p -m -r --name pplindrops --input indrops_list
```

Note:  
Input must be a list in csv format with three columns and files are sorted bams:  
3562459_2.bam,3562459,alpha  
3562814_2.bam,3562814,alpha  
3563095_2.bam,3563095,alpha  
3563458_2.bam,3563458,belta  
3563907_2.bam,3563907,belta  
3564431_2.bam,3564431,belta  
3564753_2.bam,3564753,gama  

(iii) Call variation, merge all the mutation files in the directory, generate rds file :

Input is a file list:
```
python ppl/ppl2_run.py -t 10 --input-filelist -p -m -r --name pplsmart --input smart_list
```

Input is a single bam:
```
python ppl/ppl2_run.py -p -m -r --name pplsmartsingle --input 3562459_2.bam --outprefix pplsingle
```
Note:   
The input file list should in csv format and contain file names (sorted bam files) with corresponding out prefixes in the first two columns:  
3562459_2.bam,3562459  
3562814_2.bam,3562814  
3563095_2.bam,3563095  
3563458_2.bam,3563458  
3563907_2.bam,3563907  
3564431_2.bam,3564431  
3564753_2.bam,3564753  

# RUNNING PART OF PPL

Input priority: "--split-sam" > "--mergesamecell" >"--pileup" > "--merge" > "--generate-rds"

When you add --split-sam and --pileup at the same time, your input file should be a sam or sam files list, not bam or bam files list, etc.

1."--pileup" or "-p": calling variations from a bam file and generating five txt files with 'A', 'T', 'C', 'G', 'coverage' suffixes, respectively.

(i) Input is a single file: The input should be a sorted bam file. Users can specify prefixes of outputs with the option "--outprefix".

(ii) Input is a file list: The input should be a csv table with the sorted bam files and their out prefixes. Here is an example:

3562459_2.bam,3562459  
3562814_2.bam,3562814  
3563095_2.bam,3563095  
3563458_2.bam,3563458  
3563907_2.bam,3563907  
3564431_2.bam,3564431  
3564753_2.bam,3564753  

The output is five mutation files for each input:

3562459.A.txt  3562459.coverage.txt  3562459.C.txt  3562459.G.txt  3562459.T.txt  
3562814.A.txt  3562814.coverage.txt  3562814.C.txt  3562814.G.txt  3562814.T.txt  
3563095.A.txt  3563095.coverage.txt  3563095.C.txt  3563095.G.txt  3563095.T.txt  
3563458.A.txt  3563458.coverage.txt  3563458.C.txt  3563458.G.txt  3563458.T.txt  
3563907.A.txt  3563907.coverage.txt  3563907.C.txt  3563907.G.txt  3563907.T.txt  
3564431.A.txt  3564431.coverage.txt  3564431.C.txt  3564431.G.txt  3564431.T.txt  
3564753.A.txt  3564753.coverage.txt  3564753.C.txt  3564753.G.txt  3564753.T.txt  

(iii) Related options:  
--qalign: specify minimum alignment quality required to be considered (default: 30).  
--maxBP: specify maximum length of mtDNA genome (default: 16569, for mt.fa).  
--reference: specify the mtDNA reference (default:./ppl/mito_reference/mt.fa)  

Example:
```
python ppl/ppl2_run.py -p --name {NAME} --input {SORTED_BAM} --outprefix {OUTPREFIX}

python ppl/ppl2_run.py -p --name {NAME} --input {FILELIST} --input-filelist

python ppl/ppl2_run.py -p -m --name {NAME} --input {FILELIST} --input-filelist
```

2."--merge" or "-m": merging all the 'A', 'T', 'C', 'G', 'coverage' txt files in a directory to five files with ".gz" format for the following rds generation.  
(i) Input: a directory containing mutation files

The output is five merged and compressed mutation files:  
pplsmart_all.A.txt.gz  
pplsmart_all.C.txt.gz  
pplsmart_all.G.txt.gz  
pplsmart_all.T.txt.gz  
pplsmart_all.coverage.txt.gz  

Example:
```
python ppl/ppl2_run.py -m --input {DIRECTORY}
```

3."--generate-rds" or "-r": generating rds file for downstream analysis from a directory containing merged 'A', 'T', 'C', 'G', 'coverage' txt files.

(i) Input: a directory containing merged and compressed mutation files

The output is a rds file named “processed.MAE_mito.rds”

Example:
```
python ppl/ppl2_run.py -r --input {DIRECTORY}
```

4."--split-sam": splitting a big sam file to several parts based on the cell barcodes and their corresponding cell type annotations. 

(i) Input is a single sam file: The input must be a sam file tagged with "CB:Z:" to record cell barcodes for each read. Users must provide a file annotating each cell barcode with a cell type. The example of a file with annotations is presented below.  
Example of input annotations:  
AAACCTGAGAATCTCC-9,Alpha  
AAACCTGAGAATGTTG-7,Alpha  
AAACCTGAGAGGACGG-6,Ductal  
AAACCTGAGCACCGTC-7,Alpha  
AAACCTGAGCCATCGC-1,Alpha  

Output will be several sam files and a csv file named as "split_input_file_list.csv" which can be used in the pileup process.

(ii) Input is a file list: The input should be a csv table with sam file, out prefixes and their corresponding annotation files. Here is the example:  
genome10x_98.sam,genome10x_98,human_cutted.csv  
genome10x_99.sam,genome10x_99,human_cutted.csv    
Note:   
human_cutted.csv is the input annotation for both sam files in this example.  
Output will be several sam files and a csv file named as "split_input_file_list.csv", which can be used in the pileup process.

(iii) Related options:  
--split-annotation: provide annotation file for the target sam when not using --input-filelist.  
--split-chr: contents in out sam will be filtered by the chromosome (default: MT).  

Example:
```
python ppl/ppl2_run.py –split-sam --input {SAM} --split-annotation {ANNOTATION}
python ppl/ppl2_run.py –split-sam --input {FILELIST} --split-annotation {ANNOTATION} –input-filelist
python ppl/ppl2_run.py –split-sam --input {FILELIST} --split-annotation {ANNOTATION} -p –input-filelist
```

5."--mergesamecell": merging 'A', 'T', 'C', 'G', 'coverage' txt files of the same cell type according to user's cell annotations.

(i) Input is a file list: The input must be a csv table with the sorted bam files, out prefixes and the cell type annotations. Here is an example:  
Example of inputted csv file:  
3562459_2.bam,3562459,alpha  
3562814_2.bam,3562814,alpha  
3563095_2.bam,3563095,alpha  
3563458_2.bam,3563458,belta  
3563907_2.bam,3563907,belta  
3564431_2.bam,3564431,belta  
3564753_2.bam,3564753,gama  

Example:
```
python ppl/ppl2_run.py --mergesamecell --input {FILELIST} –input-filelist
python ppl/ppl2_run.py --mergesamecell -p --input {FILELIST} –input-filelist
```

NOTE:   
The mapping quality in the final output mutation files are set to “30” because the mapping quality of mutation positions after merging makes no sense.  

6.Generating t-SNE visualization and hierarchical clustering plots  

(i) Each sample is a cell type  
```
Rscript samples.R {RDS} {PAIRED_CELLTYPE_A1},{PAIRED_CELLTYPE_A2}:{PAIRED_CELLTYPE_B1},{PAIRED_CELLTYPE_B2}:{PAIRED_CELLTYPE_A1},{PAIRED_CELLTYPE_A2}
.....
```

Example:

```
Rscript samples.R pplindrops/samecell_merged/processed.MAE_mito.rds s5_beta,s5_alpha:s6_beta,s6_alpha
```  
(ii) Each sample is a cell  
```
Rscript cells.R {RDS} {Annotation} {THREADS}
```

Example:  
```
Rscript cells.R pplsmart/processed.MAE_mito.rds annotation 10
```
The example annotation file can be found in "ppl/example/example_smart-seq2 "

# EXTRACT ALLELE FREQUENCY
Extract mitochondrial variants frequency matrix, where a column represented a single cell and a row represented variants frequency of a specific mitochondrial genotype, with two other column "altAllele" and "refAllele". 
"altAllele" column represents the mutant allele; "refAllele" column represents the reference allele. 

```
Rscript extract_af.R {RDS} 
```

Example:  
```
Rscript extract_af.R processed.MAE_mito.rds 
```
