#!/bin/bash

# Prior to executing this script:
# 1. Attach the IAM Role 'S3-Admin-Access' to the Ubuntu EC2 instance
# 2. Update and upgrade the operating system and install the AWS CLI
# 3. Reboot the EC2 instance from the AWS Console
# 4. From the EC2 instance download this bash script

# Setup snippet: clear && sudo apt update && sudo apt upgrade -y && sudo snap install aws-cli --classic && aws s3 cp s3://gelc2/setup.sh . && logout
# Monitoring d1: clear && ps -ef | grep tw_aws && echo '-s1-' && tail "$HOME"/my_env/s1/nohup.out && echo '-s2-' && tail "$HOME"/my_env/s2/nohup.out && echo '-s3-' && tail "$HOME"/my_env/s3/nohup.out && echo '-s4-' && tail "$HOME"/my_env/s4/nohup.out && echo '-s5-' && tail "$HOME"/my_env/s5/nohup.out
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

aws s3 cp s3://gelc2/env.req "$HOME"/my_env/ # Make sure the file 'env.req' is available in the bucket
pip install -r "$HOME"/my_env/env.req # Make sure the file 'env.req' contains the requirements of the environment

mkdir "$HOME"/my_env/s1/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s1/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env1 "$HOME"/my_env/s1/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s1/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s1/tw_aws_s1.py & # Uncomment as required

mkdir "$HOME"/my_env/s2/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s2/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env2 "$HOME"/my_env/s2/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s2/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s2/tw_aws_s2.py & # Uncomment as required

mkdir "$HOME"/my_env/s3/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s3/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env3 "$HOME"/my_env/s3/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s3/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s3/tw_aws_s3.py & # Uncomment as required

mkdir "$HOME"/my_env/s4/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s4/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env4 "$HOME"/my_env/s4/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s4/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s4/tw_aws_s4.py & # Uncomment as required

mkdir "$HOME"/my_env/s5/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s5/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env5 "$HOME"/my_env/s5/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s5/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s5/tw_aws_s5.py & # Uncomment as required

mkdir "$HOME"/my_env/s6/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s6/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env6 "$HOME"/my_env/s6/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s6/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s6/tw_aws_s6.py & # Uncomment as required

mkdir "$HOME"/my_env/s7/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s7/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env7 "$HOME"/my_env/s7/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s7/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s7/tw_aws_s7.py & # Uncomment as required

mkdir "$HOME"/my_env/s8/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s8/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env8 "$HOME"/my_env/s8/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s8/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s8/tw_aws_s8.py & # Uncomment as required

mkdir "$HOME"/my_env/s9/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s9/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env9 "$HOME"/my_env/s9/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s9/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s9/tw_aws_s9.py & # Uncomment as required

mkdir "$HOME"/my_env/s10/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s10/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env10 "$HOME"/my_env/s10/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s10/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s10/tw_aws_s10.py & # Uncomment as required

mkdir "$HOME"/my_env/s11/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s11/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env11 "$HOME"/my_env/s11/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s11/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s11/tw_aws_s11.py & # Uncomment as required

mkdir "$HOME"/my_env/s12/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s12/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env12 "$HOME"/my_env/s12/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s12/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s12/tw_aws_s12.py & # Uncomment as required

mkdir "$HOME"/my_env/s13/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s13/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env13 "$HOME"/my_env/s13/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s13/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s13/tw_aws_s13.py & # Uncomment as required

mkdir "$HOME"/my_env/s14/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s14/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env14 "$HOME"/my_env/s14/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s14/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s14/tw_aws_s14.py & # Uncomment as required

mkdir "$HOME"/my_env/s15/
git clone https://github.com/laelgelc/gelc2.git "$HOME"/my_env/s15/ # Update the git repository link accordingly
#aws s3 cp s3://gelc2/env15 "$HOME"/my_env/s15/.env # Update each 'env<n>' file accordingly
cd "$HOME"/my_env/s15/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python -u "$HOME"/my_env/s15/tw_aws_s15.py & # Uncomment as required
