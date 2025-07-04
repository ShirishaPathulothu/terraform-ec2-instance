#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2...$R FAILURE $N"
      exit 1
    else
      echo -e "$2...$G SUCCESS $N"
    fi    
}

if [ $USERID -ne 0 ]
then
  echo "Please run this script with root access."
  exit 1
else
  echo "you are super user"
fi

# docker
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl enable --now docker
usermod -aG docker ec2-user
VALIDATE $? "Docker installation"

# kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.7/2025-04-17/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv kubectl /usr/local/bin/kubectl
kubectl version
VALIDATE $? "kubectl installation"

# eksctl
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
mv /tmp/eksctl /usr/local/bin
eksctl version
VALIDATE $? "eksctl installation"

# kubens
git clone https://github.com/ahmetb/kubectx /opt/kubectx
ln -s /opt/kubectx/kubens /usr/local/bin/kubens
VALIDATE $? "kubens installation"

