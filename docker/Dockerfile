FROM ubuntu:18.04
LABEL MAINTAINER="Rinaldi Utomo"

ENV K8S_VERSION=v1.15.3

RUN apt-get update && apt-get upgrade -y && apt install wget -y
RUN wget -q --show-progress --https-only --timestamping \
  https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 \
  https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64 && \
chmod +x cfssl_linux-amd64 cfssljson_linux-amd64 && \
mv cfssl_linux-amd64 /usr/local/bin/cfssl && \
mv cfssljson_linux-amd64 /usr/local/bin/cfssljson && \
cfssl version

RUN wget https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl && \
chmod +x kubectl && \
mv kubectl /usr/local/bin/ && \
kubectl version --client