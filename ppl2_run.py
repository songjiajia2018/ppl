# -*- coding: utf-8 -*-
"""
Created on Wed Dec  9 14:54:53 2020

@author: cyclopenta
"""


import argparse
import sys
import os
import multiprocessing
import re
from collections import defaultdict, Counter
# Settings preloading
Setting_list = []
# parse arguments
parser = argparse.ArgumentParser(description = '''Conduct analysis based on mito-genotyping. Complete pipeline will result in a rds file 
                                 Adding arguments like "-p -m " to choose the function.'''
                                 )
parser.add_argument('--input-filelist', required = False , action = 'store_true', help = 'Input files with related \
                    out-prefixes and annotations(seperated by comma e.g.:sample1,out_prefix1,celltype(for indrops)/annotation(for spliting sam)) from a file.')
parser.add_argument('--input', required = True, type = str, help = 'the input file name.')
parser.add_argument('--name', required = False, default = 'PROJECT_MITO', type = str, help = 'The program will create \
                    a directory named by the argument. Sample processing and downstream analysis will be performed under\
                    the directory. (default: PROJECT_MITO)')
parser.add_argument('--outprefix', required = False, default = 'mitodefault', type = str, help = 'Specify an out-prefix \
                    for one file analysis. (default: ppldefault).')
parser.add_argument('-t', '--thread', required = False, default = 1, type = int, help = 'Specify the number of threads, \
                    the max number will be limited to your cpu counts. (default: 1)')
parser.add_argument('-p', '--pileup', required = False, action = 'store_true', help = 'Active Pileup Module to generate \
                    ATCG and coverage txt files. The input should be bams or a file with names of bams.')
parser.add_argument('-m', '--merge', required = False, action = 'store_true', help = 'Active Merge Module to merge results \
                    genereated from pileup module. The input should be a directory. ')
parser.add_argument('-r', '--generate-rds', required = False, action = 'store_true', help = 'Active Generate Rds Module to \
                    make rds file from merged pileup results. The input should be a dirctory')
parser.add_argument('--outdir', required = False, default = '.', type = str, help = 'Specify the output directory ')
parser.add_argument('--pplpath', required = False, default = './ppl', type = str, help = 'Specify the mito directory')
parser.add_argument('--qbase', required = False, default = 30, type = int, help = 'Specify Minimum base quality to be considered \
                    for pileup. (default: 30)')
parser.add_argument('--qalign', required = False, default = 30, type = int, help = 'Specify minimum alignment quality \
                    required to be considered. (default: 30)')
parser.add_argument('--maxBP', required = False, default = 16569, type = int, help = ' Specify maximum length of mtDNA genome. \
                    (default: 16569, for mt.fa)')
parser.add_argument('--reference', required = False, default = './ppl/mito_reference/mt.fa', type = str, help = 'Specify the mtDNA \
                    reference. (default:./ppl/mito_reference/mt.fa)')
parser.add_argument('--split-sam', required = False, action = 'store_true', help = 'split sam according to the celltype annotation, \
                    Input sam files must be tagged with "CB:Z:" for reads barcodes.')
parser.add_argument('--split-chr', required = False, default = 'MT', help = 'Contents in out sam will be filtered by the chromosome. \
                    (default: MT)')
parser.add_argument('--split-annotation', required = False, help = 'provide annotation file for the target sam when not using --input-filelist ')
parser.add_argument('--mergesamecell', required = False, action = 'store_true', help = 'Merge AGCT and coverage files according to annotation')
params = parser.parse_args()


# processing mito options
input_file_bool = params.input_filelist
input_file = params.input
project_name = params.name
out_prefix = params.outprefix
threads = params.thread
pileup_bool = params.pileup
merge_pileup_bool = params.merge
generate_rds_bool = params.generate_rds
out_dir_path = params.outdir
path = params.pplpath
qbase = params.qbase
qalign = params.qalign
maxBP = params.maxBP
reference_fasta = params.reference
mod10x_bool = params.split_sam
chr10x = params.split_chr
indrops_bool = params.mergesamecell
split_ann = params.split_annotation
# arguments initialization
work_bool_list = [pileup_bool, merge_pileup_bool, generate_rds_bool]
max_thread = len(os.sched_getaffinity(0))
file_input_process_list = []
file_outprefix_process_list = []
pileup_process_list = []
indrops_celltype_dict = defaultdict(list)



# Encapsulation pileup


def pileupfunction(mito_path, bamfile, outpre, maxBP, base_qual, sample, alignment_quality, out_dir_path, project):
    os.system('''python2 {0}/Script/01_pileup_counts.py {1} {2} {3} {4} {5} {6} ;
              mv {2}.A.txt {7}/{8};
              mv {2}.T.txt {7}/{8};
              mv {2}.C.txt {7}/{8};
              mv {2}.G.txt {7}/{8};
              mv {2}.coverage.txt {7}/{8}'''
              .format(mito_path, bamfile, outpre, maxBP, base_qual, sample, alignment_quality, out_dir_path, project))


# Encapsulation merge pileup


def mergefunction(mito_path, target_dir, projectsamplename):
    os.system('''sh {0}/Script/02_merge_pileup_counts.sh {1} {2}'''.format(mito_path, target_dir, projectsamplename))


# Encapsulation rds generation


def rdsgeneration(mito_path, target_dir, reference):
    os.system('''Rscript {0}/Script/03_makeRDS.R {1} {2}'''.format(mito_path, target_dir, reference))
# check input files


def checkinputargs(file, option, mod):
    flag = 1
    if mod == 'pileup':
        if option:
            with open(file, 'r') as f:
                for line in f:
                    line = line.rstrip()
                    file_suffix = line.split(',')[0].split('.')[-1]
                    if file_suffix.lower() != 'bam':
                        flag = 0
                        break
                return flag
        else:
            file_suffix = file.split('.')[-1]
            if file_suffix.lower() != 'bam':
                flag = 0
                return flag
    elif mod != 'draw':
        try:
            file_list = os.listdir(file)
        except NotADirectoryError:
            flag = 0
            return flag


# 10x split
def seq10xsplitfuction(samfile, outsam_prefix, annotation):
    global out_dir_path, project_name, chr10x, samtools_additional_threads
    seq10x_CB_celltype_dict = {}
    seq10x_celltype_reads_dict = defaultdict(list)
    title_line_list = []
    # record the barcode in samfile that not in annotation fole
    barcode_insam_notinannotation_list = []
    with open(annotation, 'r') as ann:
        for line in ann:
            line = line.rstrip()
            line = re.sub('\n', '', line)
            cell_barcode = line.split(',')[0].split('-')[0]
            cell_type = line.split(',')[1]
            seq10x_CB_celltype_dict[cell_barcode] = cell_type
    with open(samfile, 'r') as sam:
        for line in sam:
            if line.startswith('@'):
                title_line_list.append(line)
                continue
            else:
                chr_poi = line.split()[2]
                if chr_poi != chr10x:
                    continue
                try:
                    barcode_flag = line.split('CB:Z:')[1].split('-')[0]
                except IndexError:
                    continue
                reads_celltype_flag = seq10x_CB_celltype_dict.get(barcode_flag, 0)
                if reads_celltype_flag != 0:
                    seq10x_celltype_reads_dict[reads_celltype_flag].append(line)
                else:
                    barcode_insam_notinannotation_list.append(barcode_flag)
    out_dir_tmp = out_dir_path + '/' + project_name
    newfile_list = []
    for s10x_ct, s10x_cells in seq10x_celltype_reads_dict.items():
        file_name_prefix = out_dir_tmp + '/' + outsam_prefix + '_' + s10x_ct
        newfile_list.append((file_name_prefix + '_sorted.bam', file_name_prefix))
        with open(file_name_prefix + '.sam', 'w') as OUT:
            for titles in title_line_list:
                OUT.write(titles + '\n')
            for content in s10x_cells:
                OUT.write(content + '\n')
        os.system('''samtools view -b -@ {1} -o {0}.bam {0}.sam;
                     samtools sort -@ {1} -o {0}_sorted.bam {0}.bam'''.format(file_name_prefix, samtools_additional_threads))
    return newfile_list

# indrops merge multiprocess


def indropsmergefunction(celltype_tmp, merge_cell_list, project_tmpname, out_dir_name):
    merged_cell_number = len(merge_cell_list)
    indrops_A_dict = Counter()
    indrops_T_dict = Counter()
    indrops_C_dict = Counter()
    indrops_G_dict = Counter()
    indrops_coverage_dict = Counter()
    for cell in merge_cell_list:
        with open(out_dir_name + '/' + project_tmpname + '/' + cell + '.A.txt', 'r') as cell_now:
            for line in cell_now:
                line = line.rstrip()
                line = re.sub('\n', '', line)
                poi = int(line.split(',')[0])
                count = int(line.split(',')[2])
                indrops_A_dict[poi] += count
        with open(out_dir_name + '/' + project_tmpname + '/' + cell + '.T.txt', 'r') as cell_now:
            for line in cell_now:
                line = line.rstrip()
                line = re.sub('\n', '', line)
                poi = int(line.split(',')[0])
                count = int(line.split(',')[2])
                indrops_T_dict[poi] += count
        with open(out_dir_name + '/' + project_tmpname + '/' + cell + '.C.txt', 'r') as cell_now:
            for line in cell_now:
                line = line.rstrip()
                line = re.sub('\n', '', line)
                poi = int(line.split(',')[0])
                count = int(line.split(',')[2])
                indrops_C_dict[poi] += count
        with open(out_dir_name + '/' + project_tmpname + '/' + cell + '.G.txt', 'r') as cell_now:
            for line in cell_now:
                line = line.rstrip()
                line = re.sub('\n', '', line)
                poi = int(line.split(',')[0])
                count = int(line.split(',')[2])
                indrops_G_dict[poi] += count
        with open(out_dir_name + '/' + project_tmpname + '/' + cell + '.coverage.txt', 'r') as cell_now:
            for line in cell_now:
                line = line.rstrip()
                line = re.sub('\n', '', line)
                poi = int(line.split(',')[0])
                count = int(line.split(',')[2])
                indrops_coverage_dict[poi] += count
    indrops_A_dict = dict(indrops_A_dict)
    indrops_T_dict = dict(indrops_T_dict)
    indrops_C_dict = dict(indrops_C_dict)
    indrops_G_dict = dict(indrops_G_dict)
    indrops_coverage_dict = dict(indrops_coverage_dict)
    cell_name = celltype_tmp
    indrops_dir_path = out_dir_name + '/' + project_tmpname + '/samecell_merged'
    copy_path = out_dir_name + '/' + project_tmpname
    with open(indrops_dir_path + '/' + celltype_tmp + '.A.txt', 'w') as OUT:
        for k, v in sorted(indrops_A_dict.items(), key=lambda x: x[0]):
            str_write = str(k) + ',' + cell_name + ',' + str(v) + ',' + '30' + '\n'
            OUT.write(str_write)
        file_name_tmp = indrops_dir_path + '/' + celltype_tmp + '.A.txt'
        os.system('cp {} {}'.format(file_name_tmp, copy_path))
    with open(indrops_dir_path + '/' + celltype_tmp + '.T.txt', 'w') as OUT:
        for k, v in sorted(indrops_T_dict.items(), key=lambda x: x[0]):
            str_write = str(k) + ',' + cell_name + ',' + str(v) + ',' + '30' + '\n'
            OUT.write(str_write)
        file_name_tmp = indrops_dir_path + '/' + celltype_tmp + '.T.txt'
        os.system('cp {} {}'.format(file_name_tmp, copy_path))
    with open(indrops_dir_path + '/' + celltype_tmp + '.C.txt', 'w') as OUT:
        for k, v in sorted(indrops_C_dict.items(), key=lambda x: x[0]):
            str_write = str(k) + ',' + cell_name + ',' + str(v) + ',' + '30' + '\n'
            OUT.write(str_write)
        file_name_tmp = indrops_dir_path + '/' + celltype_tmp + '.C.txt'
        os.system('cp {} {}'.format(file_name_tmp, copy_path))
    with open(indrops_dir_path + '/' + celltype_tmp + '.G.txt', 'w') as OUT:
        for k, v in sorted(indrops_G_dict.items(), key=lambda x: x[0]):
            str_write = str(k) + ',' + cell_name + ',' + str(v) + ',' + '30' + '\n'
            OUT.write(str_write)
        file_name_tmp = indrops_dir_path + '/' + celltype_tmp + '.G.txt'
        os.system('cp {} {}'.format(file_name_tmp, copy_path))
    with open(indrops_dir_path + '/' + celltype_tmp + '.coverage.txt', 'w') as OUT:
        for k, v in sorted(indrops_coverage_dict.items(), key=lambda x: x[0]):
            str_write = str(k) + ',' + cell_name + ',' + str(v) + '\n'
            OUT.write(str_write)
        file_name_tmp = indrops_dir_path + '/' + celltype_tmp + '.coverage.txt'
        os.system('cp {} {}'.format(file_name_tmp, copy_path))


# ############## #
# start pipeline #
# ############## #
# make sure the workmod


if __name__ == '__main__':
    # input the file name and prepare for multi process
    if indrops_bool == 1:
        input_file_bool = 1
    if mod10x_bool != 0 or pileup_bool != 0 or indrops_bool != 0:
        os.system('''mkdir {0}/{1}'''.format(out_dir_path, project_name))

    if mod10x_bool:
        s10x_sam_tsv_process_list = []
        if input_file_bool == 1:
            with open(input_file)as input_file_list:
                for line in input_file_list:
                    line = line.rstrip()
                    line = re.sub('\n', '', line)
                    mysam = line.split(',')[0]
                    outsam_prefix = line.split(',')[1]
                    mytsv = line.split(',')[2]
                    s10x_sam_tsv_process_list.append((mysam, outsam_prefix, mytsv))
        else:
            mysam = input_file
            outsam_prefix = out_prefix
            mytsv = split_ann
            s10x_sam_tsv_process_list.append((mysam, outsam_prefix, mytsv))
        # confirm the the threads for pool
        if len(s10x_sam_tsv_process_list) <= threads:
            threads_10x = len(s10x_sam_tsv_process_list)
        pool_number = min(threads_10x, max_thread)
        safe_customer_threads = min(threads, max_thread)
        # make use of additional user specified threads
        samtools_additional_threads = int((safe_customer_threads - pool_number)/pool_number)
        p = multiprocessing.Pool(pool_number)
        file_list_tmp = p.starmap(seq10xsplitfuction, s10x_sam_tsv_process_list)
        p.close()
        p.join()
        new_input_file_list = []
        for i in file_list_tmp:
            new_input_file_list += i
        with open(out_dir_path + '/' + project_name + '/' + 'split_input_file_list.csv', 'w') as OUT_TMP:
            for (fn, fp) in new_input_file_list:
                OUT_TMP.write(fn + ',' + fp + '\n')
        input_file = out_dir_path + '/' + project_name + '/' + 'split_input_file_list.csv'
        print('split sam completed !')
        input_file_bool = 1

# read files for pileup
    if input_file_bool:
        with open(input_file) as input_file_list:
            for line in input_file_list:
                line = line.rstrip()
                line = re.sub('\n', '', line)
                myfile = line.split(',')[0]
                myfile_prefix = line.split(',')[1]
                if indrops_bool:
                    cell_type = line.split(',')[2]
                    indrops_celltype_dict[cell_type].append(myfile_prefix)
                file_input_process_list.append(myfile)
                file_outprefix_process_list.append(myfile_prefix)
                # sample name only consists of numbers may resulting error in downstream analysis
                # simplify the sample_prefix when using pileup with --split-sam10x
                if mod10x_bool:
                    sample_prefix = 'cell_' + myfile_prefix.split('/')[-1]
                else:
                    sample_prefix = 'cell_' + myfile_prefix
                pileup_process_list.append((path, myfile, myfile_prefix, maxBP, qbase, sample_prefix, qalign, out_dir_path, project_name))
    else:
        file_input_process_list.append(input_file)
        sample_prefix = 'cell_' + out_prefix
        file_outprefix_process_list.append(out_prefix)
        pileup_process_list.append((path, input_file, out_prefix, maxBP, qbase, sample_prefix, qalign, out_dir_path, project_name))

# pileup start
    if pileup_bool:
        check_pileup = checkinputargs(input_file, input_file_bool, 'pileup')
        if check_pileup == 0:
            print('Error, all input files for pileup must be in bam format and have bam suffix e.g.:sample1.bam')
            sys.exit(1)
        # may be need try except
            # 1 core for 1 task
        if len(file_input_process_list) <= threads:
            threads_pileup = len(file_input_process_list)
        else:
            threads_pileup = threads
        pool_number = min(threads_pileup, max_thread)
        p = multiprocessing.Pool(pool_number)
        p.starmap(pileupfunction, pileup_process_list)
        p.close()
        p.join()
        print('pileup completed !')


# indrops merge with multiprocess
    if indrops_bool:
        if mod10x_bool:
            print('''Error, program can't run the indrops module together with --split-sam10x option''')
            sys.exit(1)
        indrops_merge_fu_list = []
        for ct, cn_list in indrops_celltype_dict.items():
            indrops_merge_fu_list.append((ct, cn_list, project_name, out_dir_path))
        if len(indrops_merge_fu_list) <= threads:
            threads_indrops = len(indrops_merge_fu_list)
        else:
            threads_indrops = threads
        pool_number = min(threads_indrops, max_thread)
        p = multiprocessing.Pool(pool_number)
        os.system('mkdir {0}/{1}/samecell_merged'.format(out_dir_path, project_name))
        p.starmap(indropsmergefunction, indrops_merge_fu_list)
        p.close()
        p.join()
        print('Merge ATCG and coverage files completed!')



# merge start
    if merge_pileup_bool:
        if pileup_bool:
            input_dir_merge = out_dir_path + '/' + project_name
        if indrops_bool:
            input_dir_merge = out_dir_path + '/' + project_name + '/samecell_merged'
        if indrops_bool == 0 and pileup_bool == 0:
            input_dir_merge = input_file
        check_merge = checkinputargs(input_dir_merge, input_file_bool, 'merge')
        if check_merge == 0:
            print('Error, check if the input is a directrory containing AGCTfiles and coverage files')
            sys.exit(1)
        mergefunction(path, input_dir_merge, project_name)
        print('merge completed !')


# generate rds
    if generate_rds_bool:
        if merge_pileup_bool:
            input_dir_rds = input_dir_merge
        else:
            input_dir_rds = input_file
        check_rds = checkinputargs(input_dir_rds, input_file_bool, 'rds')
        if check_rds == 0:
            print('Error, the input for rds generation must be a directory')
            sys.exit(1)
        rdsgeneration(path, input_dir_rds, reference_fasta)
        if indrops_bool:
            copy_path_last = out_dir_path + '/' + project_name
            os.system('cp {}/*.rds {} '.format(input_dir_merge, copy_path_last))
        print('rds generation completed!')
