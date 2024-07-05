# Edit the file '.env' and provide the required parameters
# Install the required libraries in the environment by executing: 'pip install -r env.req'

# Importing the required libraries
from dotenv import load_dotenv
from pySmartDL import SmartDL, utils
import subprocess
import pandas as pd
import glob
import os
import sys
import shutil
import time
import datetime

load_dotenv()  # This line brings all environment variables from '.env' into 'os.environ'

# Define the name of the CSV file containing the list of links
links_list = os.environ['LINKS_LIST']
#links_list = 'tw_aws_links_list_test.csv'
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

# Generate a random user agent
user_agent = utils.get_random_useragent()

# Create a custom header with the user agent
headers = {'User-Agent': user_agent}

# Create a request_args dictionary with the headers
request_args = {'headers': headers}

# Iterate over each row in the DataFrame
for index, row in df.iterrows():
    link = row['Links']
    
    # Retry the download until it is successful
    while True:
        try:
            timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            print(timestamp, ': Downloading ' + link)
            obj = SmartDL(link, output_directory, threads=threads, request_args=request_args, progress_bar=False)
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
