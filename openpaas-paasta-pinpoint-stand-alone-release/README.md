# OpenPaaS PaaSTA Pinpoint Guide

## file download
###1. hbase
 
>`$ cd src`
 
>`$ cd hbase`
 
>`$ wget https://archive.apache.org/dist/hbase/1.2.1/hbase-1.2.1-bin.tar.gz`
 
###2. java
 
>`$ cd src`
 
>`$ mkdir java`
 
>`$ wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz`


##1. Pinpoint Configuration
- Hbase master :: 1 machine
- Collector :: 1 machine
- Webui :: 1 machine
- Agent :: N machine(s)

##2. Deploy
>`$ cd $BOSH_RELEASE_DIR`

>`$ bosh deployment deployment/openpaas-paasta-pinpoint-release.yml`

>`$ bosh deploy`

