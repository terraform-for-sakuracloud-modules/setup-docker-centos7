#!/bin/bash
# @sacloud-once
# @sacloud-desc-begin
# dockerのインストールを行います。
# このスクリプトは、CentOS7.Xでのみ動作します。
# @sacloud-desc-end
# @sacloud-require-archive distro-centos distro-ver-7.*


yum install -y curl || exit 1
curl -sSL https://get.docker.com/ | sh || exit 1
service docker start || exit 1

exit 0