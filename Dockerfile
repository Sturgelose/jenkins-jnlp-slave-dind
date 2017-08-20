FROM jenkinsci/jnlp-slave

USER root

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    git \
    sudo \
    libunwind8 \
    gettext

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && \
    apt-get install -y docker-ce

RUN usermod -aG rancher jenkins
USER jenkins
