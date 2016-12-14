#!/usr/bin/env bash

set -e
set -u

common_init() {
  #CHECK CATALINA_HOME
  if [ -d /var/vcap/packages/tomcat ]; then
    export CATALINA_HOME=/var/vcap/packages/tomcat
    export PATH=$PATH:$CATALINA_HOME/bin
  else
    echo "FAIL :: Setting CATALINA_HOME ..."
    exit 1
  fi
  
  #CREATE PINPOINT STARTUP
  sed '/ start /d' $CATALINA_HOME/bin/startup.sh > $CATALINA_HOME/bin/startup_pinpoint.sh
  echo 'export CATALINA_PID=pinpoint.pid' >> $CATALINA_HOME/bin/startup_pinpoint.sh
  echo 'exec "$PRGDIR"/"$EXECUTABLE" start "$@"' >> $CATALINA_HOME/bin/startup_pinpoint.sh
  chmod 755 $CATALINA_HOME/bin/startup_pinpoint.sh
  
  #CREATE PINPOINT SHUTDOWN
  sed '/ stop /d' $CATALINA_HOME/bin/shutdown.sh > $CATALINA_HOME/bin/shutdown_pinpoint.sh
  echo 'export CATALINA_PID=pinpoint.pid' >> $CATALINA_HOME/bin/shutdown_pinpoint.sh
  echo 'exec "$PRGDIR"/"$EXECUTABLE" stop "$@"' >> $CATALINA_HOME/bin/shutdown_pinpoint.sh
  
  #SET CHMOD
  chmod 755 $CATALINA_HOME/bin/shutdown_pinpoint.sh
}

common_start() {
  WAR_NAME=$1

  #CHECK PACKAGE DIR
  if [ -d /var/vcap/packages/$JOB_NAME ]; then
    export PKG_JOB_DIR=/var/vcap/packages/$JOB_NAME
  else
    echo "FAIL :: Checking PKG_JOB_DIR ..."
    exit 1
  fi

  #CHECK CATAILINA OLD ROOT DIR
  if [ -d $CATALINA_HOME/webapps/OLD_ROOT ]; then
    rm -rf $CATALINA_HOME/webapps/OLD_ROOT
  fi

  #CHECK CATAILINA ROOT DIR
  if [ -d $CATALINA_HOME/webapps/ROOT ]; then
    echo "Checking CATALINA ROOT ..."
    cp -af $CATALINA_HOME/webapps/ROOT $CATALINA_HOME/webapps/OLD_ROOT
    rm -rf $CATALINA_HOME/webapps/ROOT
    echo "SUCCESS :: Checking CATALINA ROOT ..."
  else
    echo "FAIL :: Checking CATALINA ROOT ..."
    exit 1
  fi
  
  #UNZIP WAR
  if [ -f $PKG_JOB_DIR/$WAR_NAME ]; then
    unzip -qq $PKG_JOB_DIR/$WAR_NAME -d $CATALINA_HOME/webapps/ROOT
  else
    echo "FAIL :: UNZIP WAR ..."
    exit 1
  fi
}