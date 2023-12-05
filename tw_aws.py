from pySmartDL import SmartDL
import subprocess
import pandas as pd
import glob
import os
import sys
import shutil
import time

#links_list = 'tw_aws_links_list_2019_d1.csv'
#links_list = 'tw_aws_links_list_2019_d2.csv'
#links_list = 'tw_aws_links_list_2019_d3.csv'
#links_list = 'tw_aws_links_list_2019_d4.csv'
#links_list = 'tw_aws_links_list_2019_d5.csv'
#links_list = 'tw_aws_links_list_2019_d6.csv'
#links_list = 'tw_aws_links_list_2019_d7.csv'
#links_list = 'tw_aws_links_list_2019_d8.csv'
#links_list = 'tw_aws_links_list_2019_d9.csv'
#links_list = 'tw_aws_links_list_2019_d10.csv'
#links_list = 'tw_aws_links_list_2019_d11.csv'
#links_list = 'tw_aws_links_list_2019_d12.csv'
#links_list = 'tw_aws_links_list_2019_d13.csv'
#links_list = 'tw_aws_links_list_2019_d14.csv'
#links_list = 'tw_aws_links_list_2019_d15.csv'

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
    
    while True:
        try:
            obj = SmartDL(link, output_directory, threads=threads, progress_bar=False)
            obj.start()
            break  # Break out of the while loop if the download is successful
        except Exception as e:
            print('Download failed:', e)
            print('Retrying in 5 seconds...')
            time.sleep(5)  # Wait for 5 seconds before retrying the download
    
    files_to_copy = sorted(glob.glob(output_directory + '/*'))
    for file in files_to_copy:
        subprocess.run(['aws', 's3', 'cp', file, destination], bufsize=0)
        subprocess.run(['rm', '-f', file], bufsize=0)
