curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

k3d_version_information=$(k3d version)

printf "\n$k3d_version_information\n"

echo "installing kubectl"

curl -LO https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#k3d cluster create tkb --servers 1 --agents 3 --image rancher/k3s:latest


