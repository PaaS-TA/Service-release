# OpenPaaS PaaSTA Pinpoint Guide


##1. Pinpoint Configuration
- Hbase master :: 1 machine
- Collector :: 1 machine
- Webui :: 1 machine
- Agent :: N machine(s)

##2. Deploy
>`$ cd $BOSH_RELEASE_DIR`

>`$ bosh deployment deployment/openpaas-paasta-pinpoint-release.yml`

>`$ bosh deploy`

