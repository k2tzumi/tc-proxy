## Traffic control proxy

This repository contains **Dockerfile**.  
[Squid-Based](http://www.squid-cache.org) Traffic Control proxy.

### Base Docker Image

* [centos:7](https://hub.docker.com/_/centos/)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Install [Docker Compose](https://docs.docker.com/compose/install/).

3. Download from Dockerfile from GitHub  
`git clone https://github.com/k2tzumi/tc-proxy.git`

4. Change docker-compose.yml  
Change build args. Choose network type.
``` yml
      args:
# choose network type
        - TC_TYPE=(4g|4g-limit|3g|modem-56k|wifi-a|wifi-b|wifi-g|wifi-n|terrible|none)
```
 - Other Settings.  
Create tc command shell.  
See reference.  
`tc/terrible.sh`

5. Dockerfile build.  
`docker-compose build`

6. Run  
`docker-compose up`

7. use proxy 
``` bash
$ export http_proxy="http://`docker-machine ip`:3128"
$ export https_proxy="http://`docker-machine ip`:3128"
```

### Docker hub repository

The Docker hub build can be found here: [https://hub.docker.com/r/katzumi/tc-proxy/](https://hub.docker.com/r/katzumi/tc-proxy/)
