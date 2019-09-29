FROM ubuntu:18.04
MAINTAINER Rinaldi Utomo

RUN apt-get update && apt-get upgrade -y && apt install wget -y
RUN wget -q --show-progress --https-only --timestamping \
  https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 \
  https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64 && \
chmod +x cfssl_linux-amd64 cfssljson_linux-amd64 && \
mv cfssl_linux-amd64 /usr/local/bin/cfssl && \
mv cfssljson_linux-amd64 /usr/local/bin/cfssljson && \
cfssl version

RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.13.10/bin/linux/amd64/kubectl && \
chmod +x kubectl && \
mv kubectl /usr/local/bin/ && \
kubectl version --client