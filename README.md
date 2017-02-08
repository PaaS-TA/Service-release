# openpaas-service-release

packages
소프트웨어를 설치하기 위해 필요한 파일들이 위치해 있다.

packaging : 소프트웨어를 설치하는 script가 작성되어있다.
spec : 설치할 package의 메터 정보인 이름, dependencies 및 파일 정보가 작성되어있다.
templates : 설치된 package를 구동 및 정지 및 관련 설정 파일을 구성하는 템플릿 파일
monit : 소프트웨어를 모니터링 하기 위한 pid파일 위치와 시작/정지 명령어가 작성되어있다.
spec : 설치할 job 의 메타 정보인 이름, templates 및 설정 properties 정보가 제공된다.


├── packages
│   ├── cli
│   │   ├── packaging
│   │   └── spec
│   ├── cubrid
│   │   ├── packaging
│   │   └── spec
│   ├── cubrid_broker
│   │   ├── packaging
│   │   └── spec
│   └── java7
│       ├── packaging
│       └── spec
├── jobs
│   ├── cubrid
│   │   ├── monit
│   │   ├── spec
│   │   └── templates
│   │       ├── cubrid_broker.conf.erb
│   │       ├── cubrid_broker_init.sql.erb
│   │       ├── cubrid.conf.erb
│   │       └── cubrid_ctl.erb
│   ├── cubrid_broker
│   │   ├── monit
│   │   ├── spec
│   │   └── templates
│   │       ├── bin
│   │       │   ├── cubrid_broker_ctl
│   │       │   └── monit_debugger
│   │       ├── config
│   │       │   ├── application-mvc.properties.erb
│   │       │   ├── bosh.pem.erb
│   │       │   ├── cubrid_broker.yml.erb
│   │       │   ├── datasource.properties.erb
│   │       │   └── logback.xml.erb
│   │       ├── data
│   │       │   └── properties.sh.erb
│   │       └── helpers
│   │           ├── ctl_setup.sh
│   │           └── ctl_utils.sh
