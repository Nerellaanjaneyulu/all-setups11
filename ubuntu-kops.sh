#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#source .bashrc


#! /bin/bash
apt update -y && apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws configure
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.33.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops

aws s3api create-bucket --bucket ramakrishnabucket2628.k8s.local  --region ap-south-1
aws s3api put-bucket-versioning --bucket ramakrishnabucket2628.k8s.local  --region ap-south-1 --versioning-configuration Status=Enabled
export KOPS_STATE_STORE=s3://ramakrishnabucket2628.k8s.local 
kops create cluster --name anjaneyulu.k8s.local --zones ap-south-1 --control-plane-image ami-024ebedf48d280810 --control-plane-count=1 --control-plane-size c7i-flex.large --image ami-024ebedf48d280810 --node-count=2 --node-size c7i-flex.large
kops update cluster --name anjaneyulu.k8s.local --yes --admin



export KOPS_STATE_STORE=s3://ramakrishnabucket2628.k8s.local 
echo $KOPS_STATE_STORE


