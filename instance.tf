resource "aws_instance" "project_tools" {
  instance_type               = "t2.medium"
  key_name                    = "ec2-tutorials"
  ami                         = "ami-05c13eab67c5d8861"
  vpc_security_group_ids      = [aws_security_group.vpc_standard-sg.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.standard_subnet_01.id
  #root disk
  root_block_device {
    volume_size = "20"
    volume_type = "gp2"
    encrypted = false 
    delete_on_termination = true
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y

              # Installing Python
              sudo yum install python3 -y

              # Installing AWS CLI
              curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
              sudo yum install unzip -y
              unzip awscliv2.zip
              sudo ./aws/install

              # Installing git 
              sudo yum install git -y

              # Cloning Git folder
              git clone https://github.com/DEVOPS-WITH-WEB-DEV/Splunk_Grafana_Setup.git

              # Installing Java
              sudo yum install -y java-1.8.0-openjdk

              # Installing maven
              cd /opt/
              wget https://downloads.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
              tar xvzf apache-maven-3.8.4-bin.tar.gz
              sudo mv apache-maven-3.8.4 /opt
              sudo ln -s /opt/apache-maven-3.8.4/bin/mvn /usr/bin/mvn

              # Installing Jenkins
              sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
              sudo yum install -y jenkins
              sudo systemctl start jenkins
              sudo systemctl enable jenkins

              # Installing Docker 
              sudo yum install docker -y
              sudo systemctl start docker
              sudo systemctl enable docker

              # Installing kubectl 
              sudo curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl
              sudo chmod +x ./kubectl
              sudo mkdir -p $HOME/bin
              sudo cp ./kubectl $HOME/bin/kubectl
              sudo export PATH=$HOME/bin:$PATH
              sudo echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc source $HOME/.bashrc

              # Install eksctl
              sudo yum update -y
              sudo amazon-linux-extras install -y epel
              sudo yum-config-manager --add-repo https://rpm.releases.eks.amazonaws.com/amazon-eks/1/x86_64/
              sudo yum -y install eksctl

              # Installing Node/NPM
              sudo yum install nodejs -y
              sudo yum install npm -y
              node -v
              npm -v

             # Installing minikube
             curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
             sudo install minikube-linux-amd64 -y
             sudo mv minikube /usr/local/bin/minikube 
             minikube start –driver docker
             
             EOF
  tags = {
    "Name" = "project_tools"
  }
}