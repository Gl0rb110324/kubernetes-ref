
software=""
echo -e "please enter the software for installation:\n1. [docker]\n2. [minikube]\n"

read -p "" software

if [ $software = "docker" ]; then
  sudo yum install -y yum-utils
  sudo yum-config-manager -y --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
  sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo systemctl start docker
  sudo usermod -aG docker $USER
fi

if [ $software = "minikube" ] && [sudo -v docker &> /dev/null]; then
  echo 'Docker is not installed. Please install docker first'
elif [ $software = "minikube" ]; then
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  minikube start
  minikube kubectl -- get po -A	
fi
