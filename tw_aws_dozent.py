import subprocess
import pandas as pd
import glob

date_list = 'tw_aws_dozent_date_list_test.csv'
env = 'my_env'
bucket = 'laelgelctweets'

origin = '/home/ubuntu/{}/lib/python3.10/site-packages/data/*'.format(env)
destination = 's3://{}/'.format(bucket)
logfile = 'tw_aws_dozent.log'
df = pd.read_csv(date_list, header = 0)

with open(logfile, 'a', encoding='utf8') as log:
    for index, row in df.iterrows():
        date = row['Dates']
        log.write('Processing ' + date + '\n')
        subprocess.run(['python', '-m', 'dozent', '-s', date, '-e', date], bufsize=0)
        files_to_copy = glob.glob(origin)
        for file in files_to_copy:
            subprocess.run(['aws', 's3', 'cp', file, destination], bufsize=0)
            subprocess.run(['rm', '-f', file], bufsize=0)
