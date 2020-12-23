NOTE：THIS IS A TEMPORARY INTRODUTION TO THIS REPOSITORY
# Table of Contents
1. [INTRODUCTION](#introduction)
2. [PREREQUISITES](#prerequisites)
3. [METHODS AND PRE-PROCESSINGS](#methods-and-pre-processings)
4. [USAGE](#usage)
5. [EXAMPLES](#examples)

# INTRODUCTION 
ppl is an optimized pipeline to conduct many steps in analyses in the manuscript instead of the raw scripts with poor versatility.(ppl代替了原文分析中零散的，适用面窄的脚本,是一个优化整合后的pipeline). But we still shared raw codes in the "source_code" directory for possible use.(但考虑到可能有人需要，我们还是将最初的使用的脚本分享出来，他们可以在source_code这个目录下找到）

# PREREQUISITES
python2:pysam \n
NOTE：ppl usesd scripts in https://github.com/sankaranlab/mito-genotyping to call variations and generate .rds file. \n
Python3 \n
R \n
Samtools \n

# METHODS AND PRE-PROCESSINGS
1.For 10x data:
We applied the default cellranger pipeline and transferred the out bam file to sam using samtools(version 1.9).

```
cellranger count --id={OUTDIR} --transcriptome={GENOME_PATH} --fastqs={INPUT_FASTQ_PATH} --expect-cells={EXCEPT_CELLS} --localcores={RUNNING_CORE_NUMBERS}
samtools view -h -o {OUT_SAM} {CELLRANGER_OUT_BAM}
```
For the pipeline in the manuscript, the genome was GRCH38, except_cells was set as 10000. 

Then we used perl scripts to split sam files because cells annotated as the same cell type were processed as one sample. For example(id = 97):

```
cd ./97/outs/
gzip -d filtered_feature_bc_matrix/barcodes.tsv.gz
perl ../../../split_sam.pl hIslets_III_DMSO_36_1 ../../../GSE142465_Human3_CellAnnotation_final.tsv filtered_feature_bc_matrix/barcodes.tsv aln.sam >log
```

At last, we extracted MtDNA reads from out sam files to generate the final bam files for calling variation.(最后calling variation的bam文件由上一步产生的只含有MtDNA reads的sam文件产生）
This step can be performed using ppl with --split-sam10x option to genereate bam files and corresponding file list. You can also run the complete pipeline with -p -m -r options.

2. For smart-seq2 data:
The clean fastq files were processed as follows:

```
STAR --runThreadN {RUNNING_THREADS_NUMBER} --genomeDir {GENOME_PATH} --outFileNamePrefix {PREFIX} --sjdbGTFfile {GTF} --outSAMunmapped Within --readFilesIn {FASTQ1} {FASTQ2}
samtools view -bS {STAR_OUT_SAM} > {OUT_BAM}
samtools sort  {INPUT_BAM} -o {OUT_SORTED_BAM}
samtools view -h {INPUT_SORTED_BAM} {REGION} > {FINAL_SAM}
samtools view -bS {FINAL_SAM} >{FINAL_BAM}
```

For the pipeline in the manuscript, the genome and corresponding gtf file was GRCH38(本文使用的基因组和gtf文件都是GRCH38）

3.For inDrops data:
Raw fastq reads were processed according to the custom inDrops pipelines (www.github.com/indrops/indrops) using Trimmomatic to trim reads, Bowtie 1.2.3 to map reads to the reference transcriptome and the 

meters as in the default_parameter YAML file.

```
python2 indrops.py {YAML} build_index --genome-fasta-gz {GENOME_PATH} --ensembl-gtf-gz {GTF}
python2 indrops.py {PROJECT_YAML} filter
python2 indrops.py {PROJECT_YAML} identify_abundant_barcodes
python2 indrops.py {PROJECT_YAML} sort
python2indrops.py {PROJECT_YAML} quantify
```
The obtained bam were sorted and were put into variation calling. Owing to the low sequence coverage of inDrops, we merged the ATCG and coverage files if they belonged to the same celltype. This step can be performed by adding parameter --indrops in ppl. The ppl will merged files according to the user's annotation.(经过indrops流程得到的bam文件会拿去sort和call变异。由于indrops数据的coverage比较低，我们把相同细胞类型的变异文件进行了merge。这步merge可以通过ppl来完成，他会根据用户的细胞注释对文件进行合并)。

# USAGE
To use the ppl easily, user can just download the whole repository and copy it to your work directory. 
```
usage: python ppl2_test.py [-h] [--input-filelist] --input INPUT [--name NAME]
                    [--outprefix OUTPREFIX] [-t THREAD] [-p] [-m] [-r]
                    [--outdir OUTDIR] [--pplpath PPLPATH] [--qbase QBASE]
                    [--qalign QALIGN] [--maxBP MAXBP] [--reference REFERENCE]
                    [--split-sam10x] [--split-chr SPLIT_CHR]
                    [--split-annotation SPLIT_ANNOTATION] [--indrops]
 
optional arguments:
  -h, --help            show this help message and exit
  --input-filelist      Input files with related out-prefixes(seperated by
                        comma e.g.:sample1,out_prefix1,celltype(for
                        indrops)/annotation(for spliting sam)) from a file.
  --input INPUT         the input file name.
  --name NAME           The program will create a directory named by the
                        argument. Sample processing and downstream analysis
                        will be performed under the directory. (default:
                        PROJECT_MITO)
  --outprefix OUTPREFIX
                        Specify an out-prefix for one file analysis. (default:
                        ppldefault).
  -t THREAD, --thread THREAD
                        Specify the number of threads, the max number will be
                        limited to your cpu counts. (default: 1)
  -p, --pileup          Active Pileup Module to generate ATCG and coverage txt
                        files. The input should be bams or a file with names
                        of bams.
  -m, --merge           Active Merge Module to merge results genereated from
                        pileup module. The input should be a directory.
  -r, --generate-rds    Active Generate Rds Module to make rds file from
                        merged pileup results. The input should be a dirctory
  --outdir OUTDIR       Specify the output directory
  --pplpath PPLPATH     Specify the mito directory
  --qbase QBASE         Specify Minimum base quality to be considered for
                        pileup. (default: 30)
  --qalign QALIGN       Specify minimum alignment quality required to be
                        considered. (default: 30)
  --maxBP MAXBP         Specified maximum length of mtDNA genome. (default:
                        16569, for mt.fa)
  --reference REFERENCE
                        Specify the mtDNA reference.
                        (default:./ppl/mito_reference/mt.fa)
  --split-sam10x        split sam according to the celltype annotation, Input
                        sam files must be tagged with "CB:Z:" for reads
                        barcodes.
  --split-chr SPLIT_CHR
                        Reads in out sam will be filtered by the chromosome.
                        (default: MT)
  --split-annotation SPLIT_ANNOTATION
                        provide annotation file for the target sam when not
                        using --input-filelist )
  --indrops             Merge AGCT and coverage files according to annotation
  ```
  
 INPUT:
 
The input can be a single bam/sam file, a file list or a directory depending on user's requirements. For "--split-sam10x" option, the input must be a sam file or a file list(in tsv format). The list must contain three columns without headers: sam file name, out prefix, annotation file. The example file list and annotation file can be found in a directory named "Examples". When the input is a single sam file, the out prefix and the annotation file must be spscified. For "--indrops" option, the input must be a file list(in tsv format). The list must contain three columns without headers: bam file name, out prefix, celltype. For "--pileup(-p)" option, the input must be a bam file or a file list(in tsv format). The list should contain two columns without headers. bam file name, out prefix. For "--merge(-m)" and "--generate-rds(-r)", the input should be a directory. Parameters combination "-p -m -r " is allowed (input is controlled by -p)  and they can co-exists with "--split-sam10x"(input controlled by --split-sam10x) or "--indrops” （input controlled by --indrops) to form a complete pipeline.(这三个参数加上任意其他两个参数中的一个都可以产生rds)。
  
 OUTPUT：
 
 "--split-sam10x" will provide a new file list and bam files for pileup.
 "--indrops" will generate merged ATCG and coverage fiels according to celltypes.
 "--Pileup" will generate ATCG and coverage files for every single bam.
 "--merge" will merge and gzip all the ATCG and coverage files in the directory for generating rds file.
 "--generate-rds" will generate in a rds file.
 
 # EXAMPLES
 Split sam, call variation , generate rds file
 
 ```
 python ppl/ppl2_test.py -t 10 --split-sam10x --input-filelist -p -m -r --name ppl10x --input 10x_list
 ```
 Call variation Merge ATCG and coverage files share the same celltype, generate rds file
 
 ```
 python ppl/ppl2_test.py -t 10 --indrops --input-filelist -p -m -r --name pplindrops --input indrops_list
 ```
 Call variation and generate rds file 
 ```
 python ppl/ppl2_test.py -t 10 --input-filelist -p -m -r --name pplsmart --input smart_list
 ```
 Call variation alone
 ```
 python ppl/ppl2_test.py -t 10 --input-filelist -p --input smart_list
 ```
