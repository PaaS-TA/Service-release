#!/usr/bin/env bash

# Setup env vars and folders for the ctl script
# This helps keep the ctl script as readable
# as possible

echo "BEGIN :: ctl_setup.sh ..."

set -e # exit immediately if a simple command exits with a non-zero status
set -u # report the usage of uninitialized variables

JOB_NAME=$1

# Setup job home folder
export HOME=/var/vcap
export JOB_DIR=$HOME/jobs/$JOB_NAME
export PKG_DIR=$HOME/packages
chmod 755 $JOB_DIR
chmod 755 $PKG_DIR

# export HOME=${HOME:-/home/vcap}

# Setup log, run and tmp folders
export RUN_DIR=/var/vcap/sys/run/$JOB_NAME
export LOG_DIR=/var/vcap/sys/log/$JOB_NAME
export TMP_DIR=/var/vcap/sys/tmp/$JOB_NAME
export STORE_DIR=/var/vcap/store/$JOB_NAME
export PKG_DIR=/var/vcap/packages


for dir in $RUN_DIR $LOG_DIR $TMP_DIR $STORE_DIR
do
  mkdir -p ${dir}
  chown vcap:vcap ${dir}
  chmod 775 ${dir}
done

# Add all packages' /bin & /sbin into $PATH
for package_bin_dir in $(ls -d /var/vcap/packages/*/*bin)
do
  export PATH=${package_bin_dir}:$PATH
done

export PATH=$PATH:$PKG_DIR/java/bin:$PKG_DIR/docker:$PKG_DIR/eclipse-che/bin

# Add all packages /lib into $LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:-''} # default to empty
for package_bin_dir in $(ls -d /var/vcap/packages/*/lib)
do
  export LD_LIBRARY_PATH=${package_bin_dir}:$LD_LIBRARY_PATH
done

# Setup Java home and add it into $PATH
if [[ -d $PKG_DIR/java ]]
then
  export JAVA_HOME="/var/vcap/packages/java"
  export PATH=$PATH:${JAVA_HOME}/bin
fi

# setup CLASSPATH for all jars/ folders within packages
export CLASSPATH=${CLASSPATH:-''} # default to empty
for package_jar_dir in $(ls -d /var/vcap/packages/*/*/*.jar)
do
  export CLASSPATH=${package_jar_dir}:$CLASSPATH
done

# Load some control helpers
source $PKG_DIR/bosh-helpers/ctl_utils.sh

echo "END :: ctl_setup.sh ..."