# OpenPaaS PaaSTA Pinpoint Guide

## file download

 1. hadoop
 >`$ cd src`
 >`$ mkdir hadoop`
 >`$ cd hadoop`
 >`$ wget https://archive.apache.org/dist/hadoop/core/hadoop-2.5.2/hadoop-2.5.2.tar.gz`
 
 2. hbase
 >`$ cd src`
 >`$ cd hbase`
 >`$ wget https://archive.apache.org/dist/hbase/1.2.1/hbase-1.2.1-bin.tar.gz`
 
 3. java
 >`$ cd src`
 >`$ mkdir java`
 >`$ wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz`

##1. Pinpoint Cluster Configuration
- Hadoop master(=Hbase master) :: 1 machine
- Hadoop secondary :: 1 machine
- Hadoop slave(=Hbase regionserver) :: N machine(s)
- Collector :: N machine(s)
- HAproxy webui ::  1 machine
- Webui :: N machine(s)
- Agent :: N machine(s)

##2. Deploy
>`$ cd $BOSH_RELEASE_DIR`

>`$ bosh deployment deployment/openpaas-paasta-pinpoint-cluster-release.yml`

>`$ bosh deploy`

##3. Run errand

### After deploying
>`$ bosh run errand h_master_register`

