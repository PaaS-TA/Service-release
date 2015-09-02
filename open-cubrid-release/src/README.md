$ cd ~/
$ git clone https://github.com/OpenPaaSRnD/openpaas-service-release
$ cd ~/openpaas-service-release/open-cubrid-release/src
$ wget http://ftp.cubrid.org/CUBRID_Engine/9.3.2/CUBRID-9.3.2.0016-linux.x86_64.tar.gz

$ cd ~/
$ git clone https://github.com/OpenPaaSRnD/openpaas-service-broker
$ cd ~/openpaas-service-broker/openpaas-service-java-broker-cubrid
$ gradle clean install -PjarType=openpaas_bosh -x test
$ cp build/libs/openpaas-cf-service-java-broker-cubrid.jar ~/openpaas-service-release/open-cubrid-release/src/cubrid_broker/

