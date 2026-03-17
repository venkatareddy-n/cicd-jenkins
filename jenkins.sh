#!/bin/bash

# curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# yum install fontconfig java-17-openjdk jenkins -y

##resize disk from 20GB to 50GB
# growpart /dev/nvme0n1 4

# lvextend -L +10G /dev/RootVG/rootVol
# lvextend -L +10G /dev/mapper/RootVG-varVol
# lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

# xfs_growfs /
# xfs_growfs /var/tmp
# xfs_growfs /var

# systemctl daemon-reload
# systemctl enable jenkins
# systemctl start jenkins

# docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# # Helm
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# chmod 700 get_helm.sh
# ./get_helm.sh