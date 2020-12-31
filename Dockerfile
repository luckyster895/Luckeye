#Importing base image of linux 
FROM ubuntu:latest


LABEL maintainer="Abhinav Saxena" \
      email="luckyster895@gmail.com"

#Running update  and set frontend to non interactive
RUN apt-get update && apt -y upgrade  && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata 

#Copying Requirements 
COPY requirements.txt /tmp


#Installing tools
RUN \
    apt-get install -y \
    figlet \
    sudo \
    python \
    python3 \
    python3-pip \
    htop \
    wget \
    ruby \
    curl \
    apache2 \
    dirb \
    lsof \
    unzip \
    ruby \ 
    postgresql \
    postgresql-contrib \
    postgresql-client \ 
#Wpscan dependencies
    build-essential \
    libcurl4-openssl-dev \
    libxml2 \
    libxml2-dev\
    libxslt1-dev \
    ruby-dev \
    libgmp-dev \ 
    zlib1g-dev \
#Developer tools
    git \
#Text Editors 
    vim \
    nano\
#Network tools
    ssh \
    ftp \
    tor \
    tcpdump \
    openvpn \
    nmap \
    whois \
#Forensics tools
    binwalk \
    exiftool \
    hashdeep \ 
#Password cracker
    john \
#Reverse engineering 
    radare2

#Installing Wpscan
RUN gem install wpscan
RUN wpscan --update
    
# Installing python-pip
RUN \
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py &&\
python get-pip.py


#Installing Requirements
RUN \
    pip3  install -r /tmp/requirements.txt


#Banner Import
WORKDIR /tmp
COPY /Banner/Banner.txt /tmp/Banner.txt
RUN \
    echo "cat /tmp/Banner.txt" >> /root/.bashrc

#Installing Metasploit-framework
RUN \
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall && \
    msfupdate

# Install go
WORKDIR /tmp
RUN \
    wget -q https://dl.google.com/go/go1.15.5.linux-amd64.tar.gz -O go.tar.gz && \
    tar -C /usr/local -xzf go.tar.gz
ENV GOROOT "/usr/local/go"
ENV GOPATH "/root/go"
ENV PATH "$PATH:$GOPATH/bin:$GOROOT/bin" 


# Download Wordlists 
WORKDIR /
RUN mkdir Wordlists
WORKDIR /Wordlists
RUN \
    git clone https://github.com/xmendez/wfuzz.git --depth 1 && \
    git clone https://github.com/danielmiessler/SecLists.git && \
    git clone https://github.com/fuzzdb-project/fuzzdb.git --depth 1 && \
    git clone https://github.com/daviddias/node-dirbuster.git --depth 1 && \
    curl -L -o rockyou.txt https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt && \
    curl -L -o all.txt https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt && \
    curl -L -o fuzz.txt https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt


RUN \
    mkdir Tools 
WORKDIR /Tools
#Clonning tools
RUN \
    #Dirsearch
    git clone  https://github.com/maurosoria/dirsearch.git && \
    #Whatweb
    git clone https://github.com/urbanadventurer/WhatWeb.git && \
    #SQLMap
    git clone https://github.com/sqlmapproject/sqlmap.git &&\
    #Xsstrike
    git clone https://github.com/s0md3v/XSStrike.git 


#Installing tools using go
RUN \
    #httprobe
    go get -u github.com/tomnomnom/httprobe && \ 
    #assetfinder
    go get -u github.com/tomnomnom/assetfinder && \
    #waybackurl
    go get github.com/tomnomnom/waybackurls && \
    #ffuf
    go get -u github.com/ffuf/ffuf

