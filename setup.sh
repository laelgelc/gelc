#!/bin/bash

# Prior to executing this script:
# 1. Attach the IAM Role 'S3-Admin-Access' to the Ubuntu EC2 instance
# 2. Update and upgrade the operating system
# 3. Install the AWS CLI: sudo apt install -y awscli
# 4. Reboot the EC2 instance from the AWS Console
# 5. From the EC2 instance download this script: aws s3 cp s3://gelc/setup.sh .

venv () {
    sudo apt install -y python3-pip
    sudo apt install -y python3-venv
    python3 -m venv my_env
    source "$HOME"/my_env/bin/activate
}

clear

venv

aws s3 cp s3://gelc/env.req "$HOME"/my_env/
pip install -r "$HOME"/my_env/env.req # Make sure the file 'env.req' contains the requirements of the environment

mkdir "$HOME"/my_env/s1/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s1/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s1/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s1/ || { printf "cd failed, exiting\n" >&2; return 1; }
nohup python "$HOME"/my_env/s1/tw_aws_s1.py &

mkdir "$HOME"/my_env/s2/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s2/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s2/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s2/ || { printf "cd failed, exiting\n" >&2; return 1; }
nohup python "$HOME"/my_env/s1/tw_aws_s2.py &

mkdir "$HOME"/my_env/s3/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s3/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s3/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s3/ || { printf "cd failed, exiting\n" >&2; return 1; }
nohup python "$HOME"/my_env/s1/tw_aws_s3.py &

mkdir "$HOME"/my_env/s4/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s4/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s4/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s4/ || { printf "cd failed, exiting\n" >&2; return 1; }
nohup python "$HOME"/my_env/s1/tw_aws_s4.py &

mkdir "$HOME"/my_env/s5/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s5/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s5/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s5/ || { printf "cd failed, exiting\n" >&2; return 1; }
nohup python "$HOME"/my_env/s1/tw_aws_s5.py &
