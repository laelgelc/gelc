import zipfile

with zipfile.ZipFile('example.zip', 'r') as zip_ref:
    zip_ref.extractall('.')




import os
import zipfile
import tarfile

def extract_archive(file_path):
    if file_path.endswith('.zip'):
        with zipfile.ZipFile(file_path, 'r') as zip_ref:
            zip_ref.extractall('.')
    elif file_path.endswith('.tar') or file_path.endswith('.tar.gz'):
        with tarfile.open(file_path, 'r') as tar_ref:
            tar_ref.extractall('.')
    else:
        print(f'Error: {file_path} is not a supported archive file.')


extract_archive('/path/to/archive.zip')


tweets_spark_df = spark.read.option('recursiveFileLookup', 'true').json('s3://gelctweets/2019_01/')

unarchive_key_list_2020_1.csv
unarchive_key_list_2020_2.csv
unarchive_key_list_2020_3.csv
unarchive_key_list_2020_4.csv
unarchive_key_list_2020_5.csv
unarchive_key_list_2020_6.csv
unarchive_key_list_2020_7.csv
unarchive_key_list_2020_8.csv
unarchive_key_list_2020_9.csv
unarchive_key_list_2020_10.csv
unarchive_key_list_2020_11.csv
unarchive_key_list_2020_12.csv




tw_aws_links_list_1.csv
tw_aws_links_list_2.csv
tw_aws_links_list_3.csv
tw_aws_links_list_4.csv
tw_aws_links_list_5.csv
tw_aws_links_list_6.csv
tw_aws_links_list_7.csv
tw_aws_links_list_8.csv
tw_aws_links_list_9.csv
tw_aws_links_list_10.csv
tw_aws_links_list_11.csv
tw_aws_links_list_12.csv
tw_aws_links_list_13.csv
tw_aws_links_list_14.csv
tw_aws_links_list_15.csv


twitter-stream-2020-11-15.zip: Check and decide if it is worth to redownload (server 11)
Old output directory successfully removed.
Output directory successfully created.
Old output directory successfully removed.
Output directory successfully created.
2024-01-10 12:00:43 : Downloading twitter-stream-2020-11-15.zip
2024-01-10 12:01:16 : Extracting twitter-stream-2020-11-15.zip
2024-01-10 12:02:14 : Extracting and transferring .bz2 files to S3 for twitter-stream-2020-11-15.zip
2024-01-10 12:02:15 : 44.json transferred
<omitted>
2024-01-10 12:15:37 : 44.json transferred
Traceback (most recent call last):
  File "/home/ubuntu/my_env/s11/unarchive_s11.py", line 117, in <module>
    uncompressed_data = bz_file.read()
  File "/usr/lib/python3.10/bz2.py", line 164, in read
    return self._buffer.read(size)
  File "/usr/lib/python3.10/_compression.py", line 118, in readall
    while data := self.read(sys.maxsize):
  File "/usr/lib/python3.10/_compression.py", line 99, in read
    raise EOFError("Compressed file ended before the "
EOFError: Compressed file ended before the end-of-stream marker was reached



