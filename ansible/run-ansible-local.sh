#!/bin/bash

python3 /usr/local/bin/ansible-playbook -v -i "localhost," -c local concourse-playbook.yml -K -e 'ansible_python_interpreter=/usr/local/bin/python3'
