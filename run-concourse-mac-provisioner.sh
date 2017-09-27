#!/bin/bash

CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND="/usr/local/bin/ansible-playbook -i $1, -K -v"

if [ $1 == "localhost" ]
then
    ANSIBLE_FLAG_LOCALHOST=" -c local"

    CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND+=$ANSIBLE_FLAG_LOCALHOST
else
    ANSIBLE_FLAG_SSH=" -k"
    ANSIBLE_FLAG_USERNAME=" -u pivotal"

    CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND+=$ANSIBLE_FLAG_SSH
    CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND+=$ANSIBLE_FLAG_USERNAME
fi

CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND+=" ansible/concourse-playbook.yml"

$CONCOURSE_LOCAL_MAC_PROVISIONER_COMMAND

if [ $? -eq 0 ]
then
    echo "Concourse is now running at: http://$1:8080 😎"
else
    echo "Could not run concourse provisioner script" >&2
fi
