#!/usr/bin/env bash

set -e
set -u

JOB_NAME=$1
echo "JOB_NAME = $JOB_NAME..."

common_init() {
	#REDIRECT OUTPUT
  mkdir -p /var/vcap/sys/log/monit
  exec 1>> /var/vcap/sys/log/monit/${JOB_NAME}.log
  exec 2>> /var/vcap/sys/log/monit/${JOB_NAME}.err.log
  
  #CHECK JAVA_HOME
  if [ -d /var/vcap/packages/java ]; then
    echo "Setting JAVA_HOME ..."
    export JAVA_HOME=/var/vcap/packages/java
    export PATH=$PATH:${JAVA_HOME}/bin
    echo "SUCCESS :: Setting JAVA_HOME ..."
  else
    echo "FAIL :: Setting JAVA_HOME ..."
    exit 1
  fi
  
  #CHECK CATALINA_HOME
  if [ -d /var/vcap/packages/tomcat ]; then
    echo "Setting CATALINA_HOME ..."
    export CATALINA_HOME=/var/vcap/packages/tomcat
    export PATH=$PATH:${CATALINA_HOME}/bin
    echo "SUCCESS :: Setting CATALINA_HOME ..."
  else
    echo "FAIL :: Setting CATALINA_HOME ..."
    exit 1
  fi
  
  #CREATE PINPOINT STARTUP
  sed '/ start /d' ${CATALINA_HOME}/bin/startup.sh > ${CATALINA_HOME}/bin/startup_pinpoint.sh
  echo 'export CATALINA_PID=pinpoint.pid' >> ${CATALINA_HOME}/bin/startup_pinpoint.sh
  echo 'exec "$PRGDIR"/"$EXECUTABLE" start "$@"' >> ${CATALINA_HOME}/bin/startup_pinpoint.sh
  chmod 755 ${CATALINA_HOME}/bin/startup_pinpoint.sh
  
  #CREATE PINPOINT SHUTDOWN
  sed '/ stop /d' ${CATALINA_HOME}/bin/shutdown.sh > ${CATALINA_HOME}/bin/shutdown_pinpoint.sh
  echo 'export CATALINA_PID=pinpoint.pid' >> ${CATALINA_HOME}/bin/shutdown_pinpoint.sh
  echo 'exec "$PRGDIR"/"$EXECUTABLE" stop "$@"' >> ${CATALINA_HOME}/bin/shutdown_pinpoint.sh
  
  chmod 755 ${CATALINA_HOME}/bin/shutdown_pinpoint.sh
}

common_start() {
  #CHECK PACKAGE DIR
  if [ -d /var/vcap/packages/${JOB_NAME} ]; then
    echo "Checking PKG_DIR ..."
    export PKG_DIR=/var/vcap/packages/${JOB_NAME}
    echo "SUCCESS :: Checking PKG_DIR ..."
  else
    echo "FAIL :: Checking PKG_DIR ..."
    exit 1
  fi
  #CHECK CATAILINA OLD ROOT DIR
  if [ -d ${CATALINA_HOME}/webapps/OLD_ROOT ]; then
    echo "Checking CATALINA OLD ROOT ..."
    rm -rf ${CATALINA_HOME}/webapps/OLD_ROOT
    echo "SUCCESS :: Checking OLD CATALINA ROOT ..."
  fi
  #CHECK CATAILINA ROOT DIR
  if [ -d ${CATALINA_HOME}/webapps/ROOT ]; then
    echo "Checking CATALINA ROOT ..."
    cp -af ${CATALINA_HOME}/webapps/ROOT ${CATALINA_HOME}/webapps/OLD_ROOT
    rm -rf ${CATALINA_HOME}/webapps/ROOT
    echo "SUCCESS :: Checking CATALINA ROOT ..."
  else
    echo "FAIL :: Checking CATALINA ROOT ..."
    exit 1
  fi
}