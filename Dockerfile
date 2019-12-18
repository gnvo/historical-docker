FROM ubuntu:19.10

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y tmux && \
  apt-get install -y bash-completion less nano python3 python3-pip && \
  rm -rf /var/lib/apt/lists/*

# Install ElasticSearch for python
RUN \
  pip3 install --no-cache-dir elasticsearch

# Install filebeats
RUN \
  wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.5.0-amd64.deb -O /root/filebeat-7.5.0-amd64.deb && \
  dpkg -i /root/filebeat-7.5.0-amd64.deb

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root
