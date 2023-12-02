from pySmartDL import SmartDL
import subprocess
import pandas as pd
import glob
import os
import sys
import shutil

links_list = 'tw_aws_links_list_test.csv'
#links_list = 'tw_aws_links_list_2011.csv'
#links_list = 'tw_aws_links_list_2012.csv'
#links_list = 'tw_aws_links_list_2013.csv'
#links_list = 'tw_aws_links_list_2014.csv'
#links_list = 'tw_aws_links_list_2015.csv'
#links_list = 'tw_aws_links_list_2016.csv'
#links_list = 'tw_aws_links_list_2017.csv'
#links_list = 'tw_aws_links_list_2018.csv'
#links_list = 'tw_aws_links_list_2019.csv'
#links_list = 'tw_aws_links_list_2020.csv'
#links_list = 'tw_aws_links_list_2021.csv'
#links_list = 'tw_aws_links_list_2022.csv'
#links_list = 'tw_aws_links_list_2023.csv'

output_directory = 'tw_aws_data'

if os.path.exists(output_directory):
    shutil.rmtree(output_directory)
    print('Old output directory successfully removed.')
    try:
        os.makedirs(output_directory)
        print('Output directory successfully created.')
    except OSError as e:
        print('Failed to create the directory:', e)
        sys.exit(1)
else:
    try:
        os.makedirs(output_directory)
        print('Output directory successfully created.')
    except OSError as e:
        print('Failed to create the directory:', e)
        sys.exit(1)

bucket = 'laelgelctweets'
destination = 's3://{}/'.format(bucket)
df = pd.read_csv(links_list, header = 0)
threads = 20

for index, row in df.iterrows():
    link = row['Links']
    print('Processing ' + link)
    obj = SmartDL(link, output_directory, threads=threads, progress_bar=False)
    obj.start()
    files_to_copy = sorted(glob.glob(output_directory + '/*'))
    for file in files_to_copy:
        subprocess.run(['aws', 's3', 'cp', file, destination], bufsize=0)
        subprocess.run(['rm', '-f', file], bufsize=0)
