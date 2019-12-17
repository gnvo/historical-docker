FROM ubuntu:19.10

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip wget  && \
  apt-get install -y bash-completion less nano net-tools iftop python3 inetutils-ping && \
  rm -rf /var/lib/apt/lists/*

# Install filebeats
RUN \
  wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.5.0-amd64.deb -O /root/filebeat-7.5.0-amd64.deb && \
  dpkg -i /root/filebeat-7.5.0-amd64.deb

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root
