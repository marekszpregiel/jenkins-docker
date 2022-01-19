FROM jenkins/jenkins:lts
USER root

# Install docker
RUN apt-get update && apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    vim \
    awscli \
    software-properties-common \
    lsb-release

# Install docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get -y install docker-ce docker-ce-cli containerd.io
RUN usermod -aG docker jenkins

# Install terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN echo \
  "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/terraform.list > /dev/null 
RUN apt-get update && apt-get -y install terraform

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# Install aws iam authenticator
RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x ./aws-iam-authenticator
RUN mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# Setting the number of executors
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Install plugins
#COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
