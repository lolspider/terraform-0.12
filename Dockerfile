FROM golang:alpine
MAINTAINER "devops@bigbige.com"

# Generate your gpg file before build image
COPY public.key private.key /tmp/
ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
# Change Terraform Version if you want
ENV TERRAFORM_VERSION=0.12.6
RUN apk add --update git bash openssh gnupg make gawk curl && \
    gpg --batch --import /tmp/public.key && \
    gpg --batch --import /tmp/private.key && \
    git clone https://github.com/sobolevn/git-secret.git git-secret && \
    cd git-secret && make build && \
    PREFIX="/usr/local" make install && \
    cd .. && rm -rf git-secret && \
    git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

WORKDIR $GOPATH

CMD [ "terraform" ]