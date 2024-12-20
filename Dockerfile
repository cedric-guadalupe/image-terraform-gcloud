FROM google/cloud-sdk:502.0.0-alpine
ENV TF_VERSION=1.10.0

# Installation de Python 3 et pip
RUN apk add --no-cache python3 py3-pip

WORKDIR /
# Installation terraform
RUN mkdir -p /usr/lib/terraform/${TF_VERSION} \
    && cd /usr/lib/terraform/${TF_VERSION} \
    && wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
    && unzip terraform_${TF_VERSION}_linux_amd64.zip \
    && chmod 755 /usr/lib/terraform/${TF_VERSION}/terraform \
    && ln -s /usr/lib/terraform/${TF_VERSION}/terraform /usr/bin/terraform
