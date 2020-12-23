本readme包含两个部分
1.文章的methods
2.ppl_run.py的使用

#############
#文章的methods#
#############

1.10x的数据处理
cellranger count --id={OUTDIR} --transcriptome={GENOME_PATH} --fastqs={INPUT_FASTQ_PATH} --expect-cells={EXCEPT_CELLS} --localcores={RUNNING_CORE_NUMBERS}
对于本文流程，genome为GRCH38，except_cells为10000，localcores为20 
samtools view -h -o {OUT_SAM} {CELLRANGER_OUT_BAM}
python ppl/ppl2_test.py -t 10 --split-sam10x --input-filelist -p -m -r --name ppl10x --input 10x_list
2.Smart-seq2的处理
STAR --runThreadN {RUNNING_THREADS_NUMBER} --genomeDir {GENOME_PATH} --outFileNamePrefix {PREFIX} --sjdbGTFfile {GTF} --outSAMunmapped Within --readFilesIn {FASTQ1} {FASTQ2}
samtools view -bS {STAR_OUT_SAM} > {OUT_BAM}
samtools sort  {INPUT_BAM} -o {OUT_SORTED_BAM}
samtools view -h {INPUT_SORTED_BAM} {REGION} > {FINAL_SAM}
samtools view -bS {FINAL_SAM} >{FINAL_BAM}
python ppl/ppl2_test.py -t 10 --input-filelist -p -m -r --name pplsmart --input smart_list
对于本文流程，genome为GRCH38，gtf为GRCH38
Additional threads for all the steps using samtools is 15
3.indrops的处理
步骤参考www.github.com/indrops/indrops
python2 indrops.py {YAML} build_index --genome-fasta-gz {GENOME_PATH} --ensembl-gtf-gz {GTF}
python2 indrops.py {PROJECT_YAML} filter
python2 indrops.py {PROJECT_YAML} identify_abundant_barcodes
python2 indrops.py {PROJECT_YAML} sort
python2indrops.py {PROJECT_YAML} quantify
同Smart-seq2从bam文件里提取比对上线粒体（MT）的部分
python ppl/ppl2_test.py -t 10 --indrops --input-filelist -p -m -r --name pplindrops --input indrops_list
########
#ppl_run#
########
Requirements:
Python 2.x(测试环境为2.7):
pysam
python3.x(测试环境为3.7)
R 
简单的使用方法：复制整个ppl目录到工作目录下，执行python ppl/ppl2_test.py {OPTION} --input {INPUT}
--inputfile-list: 本参数对 --split-sam10x，--indrops，-p生效，输入文件的格式应为tsv，参考文件格式在ppl/example下。注意--split-sam10x会自动产生新的filelist,和-p 连用时会自动读入新的filelist
--split-sam10x:本参数根据sam文件对应的celltype注释文件，将sam文件进行拆分，同时生成bam和sorted bam。定义--split-chr {CHR}则可以改变提取的sam文件的region
当输入文件不是filelist而是单个sam/bam时，可用--split-annotation和--outprefix指定拆分的注释文件和输出文件的prefix
--indrops：本参数根据bam文件对应的celltype注释文件，将各bam产生的ATCG和coverage文件进行合并(merge)。
-p: 产生ATCGcoverage.txt
-m:合并project里所有的ATCGcoverage.txt
-r:根据目标目录里所有的ATCGcoverage.gz文件产生rds文件

