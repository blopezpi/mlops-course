#!/bin/bash

echo "Installing docker"
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker "$USER"

echo "Installing docker-compose"
curl -sL https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-linux-x86_64 -o docker-compose && chmod +x docker-compose && sudo mv docker-compose /usr/local/bin/

echo "Installing minikube"
curl -sLO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

echo "Installing kubectl"
curl -sLO "https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl" && chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

echo "Installing helm"
curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "Installing k9s"
curl -sLJO https://github.com/derailed/k9s/releases/download/v0.26.7/k9s_Linux_x86_64.tar.gz
tar -xzf k9s_Linux_x86_64.tar.gz k9s && chmod +x k9s && sudo mv k9s /usr/local/bin/k9s && rm k9s_Linux_x86_64.tar.gz

echo "Installing helmfile"
curl -sLJO https://github.com/helmfile/helmfile/releases/download/v0.147.0/helmfile_0.147.0_linux_amd64.tar.gz
tar -xzf helmfile_0.147.0_linux_amd64.tar.gz helmfile && chmod +x helmfile && sudo mv helmfile /usr/local/bin/helmfile && rm helmfile_0.147.0_linux_amd64.tar.gz

echo "Installing conda"
curl -s https://repo.anaconda.com/miniconda/Miniconda3-py310_4.12.0-Linux-x86_64.sh -o miniconda.sh
bash miniconda.sh -u -b -p "$HOME/miniconda"
rm -rf miniconda.sh
"$HOME/miniconda/bin/conda" init bash
