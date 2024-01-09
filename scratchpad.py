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