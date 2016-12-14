#!/bin/bash

mkdir /var/vcap/data/docker 
ln -s /var/vcap/data/docker /var/lib/

dpkg -i $PKG_DIR/docker/libltdl7_2.4.2-1.7ubuntu1_amd64.deb
dpkg -i $PKG_DIR/docker/libsystemd-journal0_204-5ubuntu20.19_amd64.deb
dpkg -i $PKG_DIR/docker/aufs-tools_amd64.deb
dpkg -i $PKG_DIR/docker/liberror-perl_0.17-1.1_all.deb
dpkg -i $PKG_DIR/docker/git-man_1.9.1-1ubuntu0.3_all.deb
dpkg -i $PKG_DIR/docker/git_1.9.1-1ubuntu0.3_amd64.deb
dpkg -i $PKG_DIR/docker/docker-engine_1.12.1-0~trusty_amd64.deb
dpkg -i $PKG_DIR/docker/cgroup-lite_1.9_all.deb

groupadd docker
usermod -aG docker vcap
service docker start



