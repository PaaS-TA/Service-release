
#Source <br>
---
src 폴더내의 각 package에 설치파일이 위치해야 한다.

src<br>
├── apimanager<br>
│   └── wso2am-1.8.0.zip<br>
├── apiplatform-broker<br>
│   └── openpaas-service-java-broker-apiplatform.jar<br>
├── bam<br>
│   ├── API_Manager_Analytics.tbox<br>
│   └── wso2bam-2.5.0.zip<br>
├── cf-cli<br>
│   └── cf-linux-amd64.tgz<br>
├── java7<br>
│   └── jdk-7u75-linux-x64.gz<br>
├── jre7<br>
│   └── jre-7u80-linux-x64.gz<br>
├── mariadb<br>
│   └── mariadb-10.0.21.tar.gz<br>
├── mysql_connector_java<br>
│   └── mysql-connector-java-5.1.35.tar.gz<br>


=======
-----
```
$ cd ~/
$ git clone https://github.com/OpenPaaSRnD/openpaas-service-release
$ cd ~/openpaas-service-release/open-apiplatform-release/src/apimanager
$ wget -O 'wso2am-1.8.0.zip' http://dist.wso2.org/maven2/org/wso2/am/wso2am/1.8.0/wso2am-1.8.0.zip
$ cd ~/openpaas-service-release/open-apiplatform-release/src/bam
$ wget -O 'wso2bam-2.5.0.zip' http://dist.wso2.org/maven2/org/wso2/bam/wso2bam/2.5.0/wso2bam-2.5.0.zip
$ cd ~/openpaas-service-release/open-apiplatform-release/src/java7
$ wget -O 'jdk-7u75-linux-x64.gz' --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-linux-x64.tar.gz

```

