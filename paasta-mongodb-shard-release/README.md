# open-mongodb-shard-release

##1. Mongodb Configuration
- PaaS-TA-mongodb-broker :: 1 machine
- Mongos :: 1 machine
- Mongo Config :: 1 machine
- Mongod :: 1 machine

##2. Deploy
>`$ cd $BOSH_RELEASE_DIR`<br>
>`$ bosh deployment openpaas-mongodb-shard-vsphere-1.0.yml`<br>
>`$ bosh deploy`
