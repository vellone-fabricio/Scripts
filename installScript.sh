echo "----- What is your bash file name ? ----"
echo "Type: 1 - bashrc\n2- zshrz\n3- other (specify)"
read bashFile
if [ $bashFile = 1 ]
then
    bashFile="bashrc"
elif [ $bashFile = 2 ]
then
    bashFile="zshrc"
else
    echo "Type your bash name"
    read bashFile
fi

# installing docker
sudo apt-get install ca-certificates curl gnupg lsb-release
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable test" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo service docker start

# installing golang v1.18
curl -o go1.18.linux-amd64.tar.gz -L https://go.dev/dl/go1.18.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz

# installing shellcheck
sudo apt install shellcheck

# installing pip - if you are in WSL2
sudo apt install python3-pip

# installing pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl

sudo apt install python3-venv

# installing aws cli
sudo python3 -m pip install awscli

# installing tfswitch
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash


# installing terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

# Terraform linter
sudo curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# installing pre-commit
pip install pre-commit

echo "Now adding all PATH export to your bash File!"
## exporting PATHs
echo "export PATH=$PATH:/usr/local/go/bin" >> "~/.${bashFile}"
echo "export PATH=$PATH:/usr/local/go/bin"  >> "~/.${bashFile}"
echo 'eval "$(pyenv init -)"' >> "~./${bashFile}"

echo "Please, verify your bash file, and be sure that your new variables are set"
sleep 3
