
## Project Name:Luckeye
-------------------------------------------------------------------------------

## Description
This image contain useful and mostly used tools that are highly required for web pentester and ctf players and which is platform independent u just need docker installed on main system

## Network Tools 
- openvpn
- whois
- tcpdump
- ftp
- ssh
- nmap
- shodan 

## Forensics Tools
- exiftool
- binwalk

## Text Editors 
- vim
- nano

## Web Tools
- [httprobe](https://github.com/tomnomnom/httprobe)
- [assetfinder](https://github.com/tomnomnom/assetfinder)
- [waybackurl](https://github.com/tomnomnom/waybackurls)
- [dirsearch](https://github.com/maurosoria/dirsearch.git)
- [whatweb](https://github.com/urbanadventurer/WhatWeb.git)
- wpscan
- ffuf

## Database tools
- [sqlmap](https://github.com/sqlmapproject/sqlmap.git)

## Password cracker
- john the ripper(john)

## Reversing tools
- Redare2

## Wordlists
- [Rockyou](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt)
- [Fuzz](https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt)
- [Wfuzz](https://github.com/xmendez/wfuzz.git)
- [SecList](https://github.com/danielmiessler/SecLists.git)
- [Dirbuster](https://github.com/daviddias/node-dirbuster.git)

## To Run this Image
```
docker pull luckyster895/luckeye
```
```
docker run -ti luckyster895/luckeye /bin/bash
```

## Tor not installed on main system(No Problem)
```
docker pull luckyster895/luckeye
```
```
docker run -p 127.0.0.1:9150:9150 -ti luckyster895/luckeye /bin/bash
```
```
tor
```

And last step is to configure the browser or burpsuite:
```
SOCKS5
IP:127.0.0.1
PORT:9150
```

# Before running shodan
``
shodan init <your_api_key>
``

Suggestions are welcome 
https://github.com/luckyster895/Luckeye/discussions
