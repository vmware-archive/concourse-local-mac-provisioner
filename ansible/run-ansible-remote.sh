#!/bin/bash

python3 /usr/local/bin/ansible-playbook -v -i "hosts" -u pivotal -k -K concourse-playbook.yml -e 'ansible_python_interpreter=/usr/local/bin/python3'
