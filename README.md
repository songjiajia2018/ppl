NOTE：THIS IS A TEMPORARY INTRODUTION TO THIS REPOSITORY

# Table of Contents
1. [INTRODUCTION](#introduction)
2. [PREREQUISITES](#prerequisites)
3. [METHODS AND PRE-PROCESSING](#methods-and-pre-processing)
4. [USAGE](#usage)  
    4.1 [RUNNING PPL WITH A SINGLE MODULE](#running-ppl-with-a-single-module)  
    4.2 [RUNNING PPL WITH MANY MODULES](#running-ppl-with-many-modules)  
5. [EXAMPLES](#examples)

# INTRODUCTION 
PPL is an optimized and integrated pipeline that conducts many steps of analyses within the manuscript instead of raw scripts that have poor versatility. However, raw codes within the "source_code" directory were still shared for possible use. PPL integrated five main functions, including (i) calling variations from a bam file and generating five txt files with 'A', 'T', 'C', 'G', 'coverage' suffixes respectively("--pileup" or "-p"); (ii) merging all the 'A', 'T', 'C', 'G', 'coverage' txt files in a directory to five files with ".gz" format for the following rds generation("--merge" or "-m"); (iii) generating rds file for downstream analyses from a directory containing merged 'A', 'T', 'C', 'G', 'coverage' txt file("--generate-rds" or "-r"); (iv) spliting a big sam file to several parts based on the cell barcodes and their corresponding celltype annotations("--split-sam10x"); (V) merging 'A', 'T', 'C', 'G', 'coverage' txt files of the same celltype according to user's cell annotations.

# PREREQUISITES
python2:pysam  
NOTE：PPL uses scripts in https://github.com/sankaranlab/mito-genotyping to call variations and generate rds files   
Python3   
R   
Samtools   

# METHODS AND PRE-PROCESSING
1.For 10x data:
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

2. For smart-seq2 data:
The clean fastq files were processed as follows:

```
STAR --runThreadN {RUNNING_THREADS_NUMBER} --genomeDir {GENOME_PATH} --outFileNamePrefix {PREFIX} --sjdbGTFfile {GTF} --outSAMunmapped Within --readFilesIn {FASTQ1} {FASTQ2}
samtools view -bS {STAR_OUT_SAM} > {OUT_BAM}
samtools sort  {INPUT_BAM} -o {OUT_SORTED_BAM}
samtools view -h {INPUT_SORTED_BAM} {REGION} > {FINAL_SAM}
samtools view -bS {FINAL_SAM} >{FINAL_BAM}
```

For the pipeline in the manuscript, the genome and corresponding gtf file was GRCH38(The genome and gtf files used in this article are both GRCH38）

3. For inDrops data:
Raw fastq reads were processed according to the custom inDrops pipelines (www.github.com/indrops/indrops) using Trimmomatic to trim reads, Bowtie 1.2.3 to map reads to the reference transcriptome and the meters as in the default_parameter YAML file.

```
python2 indrops.py {YAML} build_index --genome-fasta-gz {GENOME_PATH} --ensembl-gtf-gz {GTF}
python2 indrops.py {PROJECT_YAML} filter
python2 indrops.py {PROJECT_YAML} identify_abundant_barcodes
python2 indrops.py {PROJECT_YAML} sort
python2indrops.py {PROJECT_YAML} quantify
```
The bam file obtained through the indrops process will be used for sort and call mutations. Since the coverage of indrops data is relatively low, we merged the mutation files of the same cell types. This step can be done through PPL, and will merge the files according to the user's cell annotations.

# USAGE
As is described above, PPL has five main functions resulting different inputs and outputs. User can run a single module in the PPL or combine many of them to reach their purposes. Note that except onlying runing PPL with option "--merge"(-m) or "--generate-rds"(-r), PPL will automatically created a directory which path is specified by "--outdir"/"--name". All the outputs will under that directory.
User can find examples for input and output in the "ppl/Examples" dircetory.
To use the PPL easier, users can just download the whole repository and copy it to the work directory. 

# RUNNING PPL WITH A SINGLE MODULE
1. "--pileup" or "-p": calling variations from a bam file and generating five txt files with 'A', 'T', 'C', 'G', 'coverage' suffixes respectively.

(i) Input is a single file: The input should be a sorted bam file. User can specify prefixes of outputs with the option "--outprefix".

(ii) Input is a file list: The input should be a csv table with the sorted bam file and their outprefixes. Here is the example:

    ```
    3562459_2.bam,3562459
    3562814_2.bam,3562814
    3563095_2.bam,3563095
    3563458_2.bam,3563458
    3563907_2.bam,3563907
    3564431_2.bam,3564431
    3564753_2.bam,3564753
    '''
    
    The output are five mutations files for each input :
    
    ```
    3562459.A.txt         3562814.A.txt         3563095.A.txt         3563458.A.txt         3563907.A.txt         3564431.A.txt         3564753.A.txt
    3562459.coverage.txt  3562814.coverage.txt  3563095.coverage.txt  3563458.coverage.txt  3563907.coverage.txt  3564431.coverage.txt  3564753.coverage.txt
    3562459.C.txt         3562814.C.txt         3563095.C.txt         3563458.C.txt         3563907.C.txt         3564431.C.txt         3564753.C.txt
    3562459.G.txt         3562814.G.txt         3563095.G.txt         3563458.G.txt         3563907.G.txt         3564431.G.txt         3564753.G.txt
    3562459.T.txt         3562814.T.txt         3563095.T.txt         3563458.T.txt         3563907.T.txt         3564431.T.txt         3564753.T.txt
    ```
    
2.
    






The input can be a single bam/sam file, a file list or a directory; depending on the user's requirements.   
For the "--split-sam10x" option, the input must be a sam file or a file list (in csv format). The list must contain three columns without headers: sam file name, out prefix, annotation file. The example file list and annotation file can be found in a directory named "Examples". When the input is a single sam file, the out prefix and the annotation file must be specified.  
For the "--indrops" option, the input must be a file list (in csv format).The list must contain three columns without headers: bam file name, out prefix, cell-type.  
For the "--pileup(-p)" option, the input must be a bam file or a file list (in csv format).  The list should contain two columns without headers, a bam file name and an out prefix.   
For "--merge(-m)" and "--generate-rds(-r)", the input should be a directory.  
Parameters combination "-p -m -r " is allowed (input is controlled by -p)  and they can co-exist with "--split-sam10x" (input controlled by --split-sam10x) and/or "--indrops” （input controlled by --indrops) to form a complete pipeline. (These three parameters plus any of the other two parameters can generate a rds).
  
OUTPUT：  
 "--split-sam10x" will provide a new file list and bam files for pileup.
 "--indrops" will generate merged ATCG and coverage files according to cell-types.
 "--Pileup" will generate ATCG and coverage files for every single bam.
 "--merge" will merge and gzip all the ATCG and coverage files in the directory for generating rds files.
 "--generate-rds" will generate a rds file.
 
 # EXAMPLES
 Split sam, call variation, generate rds file
 
 ```
 python ppl/ppl2_test.py -t 10 --split-sam10x --input-filelist -p -m -r --name ppl10x --input 10x_list
 ```
 Call variation Merge ATCG and coverage files share the same cell-type, generate rds file
 
 ```
 python ppl/ppl2_test.py -t 10 --indrops --input-filelist -p -m -r --name pplindrops --input indrops_list
 ```
 Call variation and generate rds file 
 ```
 python ppl/ppl2_test.py -t 10 --input-filelist -p -m -r --name pplsmart --input smart_list
 ```
 Call variation alone
 ```

