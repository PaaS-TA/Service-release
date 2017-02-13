# openpaas-service-release
<br>
- packages : 소프트웨어를 설치하기 위해 필요한 파일들이 위치해 있다.<br>
<br>
- packaging : 소프트웨어를 설치하는 script가 작성되어있다.<br>
<br>
- spec : 설치할 package의 메터 정보인 이름, dependencies 및 파일 정보가 작성되어있다.<br>
<br>
- templates : 설치된 package를 구동 및 정지 및 관련 설정 파일을 구성하는 템플릿 파일<br>
<br>
- monit : 소프트웨어를 모니터링 하기 위한 pid파일 위치와 시작/정지 명령어가 작성되어있다.<br>
<br>
- spec : 설치할 job 의 메타 정보인 이름, templates 및 설정 properties 정보가 제공된다.<br>
<br>
- config : 최종 release를 저장하기 위한 Bosh blobstore에 URL 및 액세스 자격 증명을 위한 설정 파일로 구성한다.<br>
<br>
- releases : 버전별 서비스 release yml 파일들을 관리한다.(yaml 설치 방식)<br>
<br>
- jobs : bosh가 IaaS에 의해 가상 머신을 어떤 방법으로 생성하고 구동하는지를 정의한다.<br>
<br>
<br>
예제)<br>
<br>
<br>
├── packages<br>
│   ├── cli<br>
│   │   ├── packaging<br>
│   │   └── spec<br>
│   ├── cubrid<br>
│   │   ├── packaging<br>
│   │   └── spec<br>
│   ├── cubrid_broker<br>
│   │   ├── packaging<br>
│   │   └── spec<br>
│   └── java7<br>
│       ├── packaging<br>
│       └── spec<br>
├── jobs<br>
│   ├── cubrid<br>
│   │   ├── monit<br>
│   │   ├── spec<br>
│   │   └── templates<br>
│   │       ├── cubrid_broker.conf.erb<br>
│   │       ├── cubrid_broker_init.sql.erb<br>
│   │       ├── cubrid.conf.erb<br>
│   │       └── cubrid_ctl.erb<br>
│   ├── cubrid_broker<br>
│   │   ├── monit<br>
│   │   ├── spec<br>
│   │   └── templates<br>
│   │       ├── bin<br>
│   │       │   ├── cubrid_broker_ctl<br>
│   │       │   └── monit_debugger<br>
│   │       ├── config<br>
│   │       │   ├── application-mvc.properties.erb<br>
│   │       │   ├── bosh.pem.erb<br>
│   │       │   ├── cubrid_broker.yml.erb<br>
│   │       │   ├── datasource.properties.erb<br>
│   │       │   └── logback.xml.erb<br>
│   │       ├── data<br>
│   │       │   └── properties.sh.erb<br>
│   │       └── helpers<br>
│   │           ├── ctl_setup.sh<br>
│   │           └── ctl_utils.sh<br>
├── config<br>
│   ├── blobs.yml<br>
│   ├── dev.yml<br>
│   ├── final.yml<br>
│   └── private.yml<br>
├── releases<br>
│   └── openpaas-cubrid <br>
│       ├── index.yml <br>
│       └── openpaas-cubrid-1.0.yml<br>
