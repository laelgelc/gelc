#!/bin/bash

# Prior to executing this script:
# 1. Attach the IAM Role 'S3-Admin-Access' to the Ubuntu EC2 instance
# 2. Update and upgrade the operating system and install the AWS CLI
# 3. Reboot the EC2 instance from the AWS Console
# 4. From the EC2 instance download this bash script

# Setup snippet: clear && sudo apt update && sudo apt upgrade -y && sudo apt install -y awscli && aws s3 cp s3://gelc/setup.sh . && logout
# Monitoring d1: clear && ps -ef | grep tw_aws && echo '-s1-' && tail "$HOME"/my_env/s1/nohup.out && echo '-s2-' && tail "$HOME"/my_env/s2/nohup.out && echo '-s9-' && tail "$HOME"/my_env/s9/nohup.out && echo '-s11-' && tail "$HOME"/my_env/s11/nohup.out
# Monitoring d2: clear && ps -ef | grep tw_aws && echo '-s6-' && tail "$HOME"/my_env/s6/nohup.out && echo '-s7-' && tail "$HOME"/my_env/s7/nohup.out && echo '-s8-' && tail "$HOME"/my_env/s8/nohup.out && echo '-s9-' && tail "$HOME"/my_env/s9/nohup.out && echo '-s10-' && tail "$HOME"/my_env/s10/nohup.out
# Monitoring d3: clear && ps -ef | grep tw_aws && echo '-s11-' && tail "$HOME"/my_env/s11/nohup.out && echo '-s12-' && tail "$HOME"/my_env/s12/nohup.out && echo '-s13-' && tail "$HOME"/my_env/s13/nohup.out && echo '-s14-' && tail "$HOME"/my_env/s14/nohup.out && echo '-s15-' && tail "$HOME"/my_env/s15/nohup.out

venv () {
    sudo apt install -y python3-pip
    sudo apt install -y python3-venv
    python3 -m venv my_env
    source "$HOME"/my_env/bin/activate
}

clear

venv

aws s3 cp s3://gelc/env.req "$HOME"/my_env/ # Make sure the file 'env.req' is available in the bucket
pip install -r "$HOME"/my_env/env.req # Make sure the file 'env.req' contains the requirements of the environment

#mkdir "$HOME"/my_env/s1/
#git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s1/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s1/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s1/ || { printf "cd failed, exiting\n" >&2; return 1; }
nohup python -u "$HOME"/my_env/s1/tw_aws_s2_1.py & # Uncomment as required

#mkdir "$HOME"/my_env/s2/
#git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s2/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s2/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s2/ || { printf "cd failed, exiting\n" >&2; return 1; }
nohup python -u "$HOME"/my_env/s2/tw_aws_s2_2.py & # Uncomment as required

#mkdir "$HOME"/my_env/s4/
#git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s4/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s4/.env # Update the reference to the '.env' file accordingly
#cd "$HOME"/my_env/s4/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s4/tw_aws_s4.py & # Uncomment as required

#mkdir "$HOME"/my_env/s9/
#git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s9/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s9/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s9/ || { printf "cd failed, exiting\n" >&2; return 1; }
nohup python -u "$HOME"/my_env/s9/tw_aws_s2_9.py & # Uncomment as required

#mkdir "$HOME"/my_env/s11/
#git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s11/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s11/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s11/ || { printf "cd failed, exiting\n" >&2; return 1; }
nohup python -u "$HOME"/my_env/s11/tw_aws_s2_11.py & # Uncomment as required
