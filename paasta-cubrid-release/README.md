
src
---
src 폴더에 각 package의 설치파일이 위치해야 한다.

src <br>
├── cubrid <br>
│     └── CUBRID-9.3.2.0016-linux.x86_64.tar.gz <br>
├── cubrid_broker <br>
│     └── openpaas-cf-service-java-broker-cubrid.jar <br>
├── java7 <br>
│     └── jre-7u45-linux-x64.gz <br>
└── README.md <br>


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
$ gradle clean build -PjarType=openpaas_bosh -x test
$ cp build/libs/openpaas-cf-service-java-broker-cubrid.jar ~/openpaas-service-release/open-cubrid-release/src/cubrid_broker/
```

