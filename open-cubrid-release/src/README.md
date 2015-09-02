<<<<<<< HEAD
$ cd ~/

$ git clone https://github.com/OpenPaaSRnD/openpaas-service-release

$ git clone https://github.com/OpenPaaSRnD/openpaas-service-broker

$ cd ~/openpaas-service-release/open-cubrid-release/src

$ mkdir cubrid

$ mkdir cubrid_broker

$ cd cubrid

$ wget http://ftp.cubrid.org/CUBRID_Engine/9.3.2/CUBRID-9.3.2.0016-linux.x86_64.tar.gz

$ cd ~/openpaas-service-broker/openpaas-service-java-broker-cubrid

$ gradle clean install -PjarType=openpaas_bosh -x test

$ cp build/libs/openpaas-cf-service-java-broker-cubrid.jar ~/openpaas-service-release/open-cubrid-release/src/cubrid_broker/
=======
-----
```
$ cd ~/
$ git clone https://github.com/OpenPaaSRnD/openpaas-service-release
$ git clone https://github.com/OpenPaaSRnD/openpaas-service-broker
$ cd ~/openpaas-service-release/open-cubrid-release/src
$ mkdir cubrid
$ mkdir cubrid_broker
$ cd cubrid
$ wget http://ftp.cubrid.org/CUBRID_Engine/9.3.2/CUBRID-9.3.2.0016-linux.x86_64.tar.gz
$ cd ~/openpaas-service-broker/openpaas-service-java-broker-cubrid
$ gradle clean install -PjarType=openpaas_bosh -x test
$ cp build/libs/openpaas-cf-service-java-broker-cubrid.jar ~/openpaas-service-release/open-cubrid-release/src/cubrid_broker/
```
>>>>>>> e33df21684d4f156fc83a875c5ce2cc86bb3a6aa
