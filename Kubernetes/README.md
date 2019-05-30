*Installation of Kubernetes*
===============================

*Kubeadm* helps you setup/bootstrap a minimum viable/usable Kubernetes cluster

Login on MasterNode and Client-Node
------------------------------------------
[rohit@master ~]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4<br/>
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

192.168.43.8    master.k8s.com master
192.168.43.29   node1.k8s.com node1

[rohit@master ~]$ systemctl stop firewalld

Enable the sysctl setting net.bridge.bridge-nf-call-iptables
-----------------------------------------------------------------

cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl -p


*Install container runtime (Docker):* on both Node Master and Client Node

yum install docker
systemctl enable docker
systemctl start docker
systemctl status docker


*Install kubeadm, kubelet and kubectl:* on both Node Master and Client Node


On each node, install:

* kubeadm: the command to actually setup / bootstrap the cluster.
* kubelet: the component that runs on all of the machines in your cluster and does things like starting pods and containers.
* kubectl: the command line util to talk to your cluster.

Kubernetes's yum repository. 

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF

sudo sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/' /etc/selinux/config

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

systemctl enable kubelet && systemctl start kubelet




