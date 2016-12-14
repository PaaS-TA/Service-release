# OpenPaaS PaaSTA Pinpoint Guide


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

