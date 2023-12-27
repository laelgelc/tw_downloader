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

aws s3 cp s3://gelc/env.req "$HOME"/my_env/ # Make sure the file 'env.req' is available in the bucket
pip install -r "$HOME"/my_env/env.req # Make sure the file 'env.req' contains the requirements of the environment

mkdir "$HOME"/my_env/s1/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s1/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s1/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s1/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s1/tw_aws_s1.py &

mkdir "$HOME"/my_env/s2/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s2/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s2/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s2/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s2/tw_aws_s2.py &

mkdir "$HOME"/my_env/s3/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s3/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s3/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s3/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s3/tw_aws_s3.py &

mkdir "$HOME"/my_env/s4/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s4/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s4/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s4/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s4/tw_aws_s4.py &

mkdir "$HOME"/my_env/s5/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s5/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s5/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s5/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s5/tw_aws_s5.py &

mkdir "$HOME"/my_env/s6/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s6/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s6/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s6/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s6/tw_aws_s6.py &

mkdir "$HOME"/my_env/s7/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s7/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s7/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s7/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s7/tw_aws_s7.py &

mkdir "$HOME"/my_env/s8/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s8/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s8/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s8/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s8/tw_aws_s8.py &

mkdir "$HOME"/my_env/s9/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s9/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s9/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s9/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s9/tw_aws_s9.py &

mkdir "$HOME"/my_env/s10/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s10/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s10/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s10/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s10/tw_aws_s10.py &

mkdir "$HOME"/my_env/s11/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s11/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s11/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s11/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s11/tw_aws_s11.py &

mkdir "$HOME"/my_env/s12/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s12/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s12/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s12/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s12/tw_aws_s12.py &

mkdir "$HOME"/my_env/s13/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s13/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s13/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s13/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s13/tw_aws_s13.py &

mkdir "$HOME"/my_env/s14/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s14/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s14/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s14/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s14/tw_aws_s14.py &

mkdir "$HOME"/my_env/s15/
git clone https://github.com/laelgelc/gelc.git "$HOME"/my_env/s15/ # Update the git repository link accordingly
#aws s3 cp s3://gelc/.env "$HOME"/my_env/s15/.env # Update the reference to the '.env' file accordingly
cd "$HOME"/my_env/s15/ || { printf "cd failed, exiting\n" >&2; return 1; }
#nohup python "$HOME"/my_env/s15/tw_aws_s15.py &

