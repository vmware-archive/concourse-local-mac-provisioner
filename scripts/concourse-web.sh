#!/usr/bin/env bash

/usr/local/bin/concourse \
    web \
    --basic-auth-username pivotal \
    --basic-auth-password $(security find-generic-password -l concourse_local -w) \
    --session-signing-key /Users/pivotal/workspace/concourse/keys/session_signing_key \
    --tsa-host-key /Users/pivotal/workspace/concourse/keys/tsa_host_key \
    --tsa-authorized-keys /Users/pivotal/workspace/concourse/keys/authorized_worker_keys \
    --postgres-user pivotal