from pySmartDL import SmartDL
import subprocess
import pandas as pd
import glob
import os
import sys
import shutil
import time
import datetime

# Define the name of the CSV file containing the list of links
links_list = 'tw_aws_links_list_10.csv'

# Define the name of the directory where the downloaded files will be stored
output_directory = 'tw_aws_data'

# Check if the output directory already exists. If it does, remove it and its contents. If it doesn't exist, create it.
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

# Define the name of the S3 bucket
bucket = 'laelgelctweets'
destination = 's3://{}/'.format(bucket)

# Read the CSV file into a pandas DataFrame
df = pd.read_csv(links_list, header=0)

# Define the number of threads to use for downloading files
threads = 20

# Iterate over each row in the DataFrame
for index, row in df.iterrows():
    link = row['Links']
    
    # Retry the download until it is successful
    while True:
        try:
            timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(timestamp, ': Downloading ' + link)
            obj = SmartDL(link, output_directory, threads=threads, progress_bar=False)
            obj.start()
            break  # Break out of the while loop if the download is successful
        except Exception as e:
            timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(timestamp, ': Download failed:', e)
            time.sleep(5)  # Wait for 5 seconds before retrying the download
            timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(timestamp, ': Retrying ' + link)
    
    # Get a list of files in the output directory
    files_to_copy = sorted(glob.glob(output_directory + '/*'))
    
    # Copy the downloaded files to the S3 bucket using the aws s3 cp command
    timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print(timestamp, ': Transferring to ', destination, ' and clearing ', output_directory)
    for file in files_to_copy:
        subprocess.run(['aws', 's3', 'cp', file, destination], bufsize=0)
        subprocess.run(['rm', '-f', file], bufsize=0)
    
    # Print timestamp after each download
    timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    print(timestamp, ': Download completed.')
