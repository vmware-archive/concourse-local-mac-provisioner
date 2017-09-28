#!/usr/bin/env bash

PATH=$PATH:/usr/local/bin
eval $(sudo -u pivotal /usr/local/bin/docker-machine env default) && /usr/local/bin/docker run -e "CONCOURSE_TSA_HOST=$(/sbin/ifconfig vboxnet0 | /usr/bin/grep inet | /usr/bin/awk '{print $2}')" -e "CONCOURSE_TSA_PUBLIC_KEY=/concourse-keys/tsa_host_key.pub" -e "CONCOURSE_TSA_WORKER_PRIVATE_KEY=/concourse-keys/linux_worker_key" -v "/Users/pivotal/workspace/concourse/keys/linux-worker:/concourse-keys" --privileged concourse/concourse:3.5.0 worker