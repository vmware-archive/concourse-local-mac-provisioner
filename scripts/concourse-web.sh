#!/usr/bin/env bash

source ~/workspace/concourse/.env

/usr/local/bin/concourse \
    web \
    --basic-auth-username pivotal \
    --basic-auth-password $CONCOURSE_PASSWORD \
    --session-signing-key /Users/pivotal/workspace/concourse/keys/session_signing_key \
    --tsa-host-key /Users/pivotal/workspace/concourse/keys/tsa_host_key \
    --tsa-authorized-keys /Users/pivotal/workspace/concourse/keys/authorized_worker_keys \
    --postgres-user pivotal