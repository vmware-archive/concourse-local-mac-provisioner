# Concourse Local Mac Provisioner

This tool deploys a MacOS concourse web server, darwin (aka MacOS) worker, and a dockerized linux worker onto a target mac. 
It will also install any missing dependencies that are necessary for deploying concourse onto the target machine.

The concourse web server, darwin worker, and linux worker are all registered as LaunchAgents, so they will persist and restart themselves even if you reboot the machine. 

# Motivation

1. Projects often need a quick and simple CI setup.
1. We would like to use concourse in our projects more often.
1. The default concourse docker images do not allow iOS tests to be run. This tool includes a mac worker to address this need.
1. Common tasks like provisioning CI machines should be automated and low maintenance.

# Usage

## Overview
There are two machine entities involved when using this tool: the control machine, and the target machine.

The control machine is the entity that initiates provisioning, and the target machine is the entity that you would like to deploy concourse onto.
If you're deploying locally, then they are the same. Otherwise, if you're deploying onto a remote machine, then they are separate.

**Notes**: 

* Passwords are stored in the user keychain.
* Please note that you will need ssh access to a remote machine in order to deploy concourse onto it.

## Tool Dependencies

This tool requires the following packages installed on the control machine in order to run:
  * [ansible](http://docs.ansible.com/ansible/)

It also requires the following packages to be installed on the target machine:
  * [xcode command line tools](https://developer.apple.com/xcode/) - must be downloaded from either the MacOS App Store or Apple's developer site
  * [homebrew](https://brew.sh)

## Examples:

*Control machine deploys to itself (aka deploy to localhost)*

```
git clone https://github.com/pivotal-tokyo/concourse-local-mac-provisioner

cd concourse-local-mac-provisioner/ansible

./run-concourse-mac-provisioner.sh localhost

# Concourse is now running at http://localhost:8080
```

*Control machine deploys to target machine (e.g. california-roll.sushi.com)*

```
git clone https://github.com/pivotal-tokyo/concourse-local-mac-provisioner

cd concourse-local-mac-provisioner/ansible

./run-concourse-mac-provisioner.sh california-roll.sushi.com

# Concourse is now running at http://california-roll.sushi.com:8080
```

## Logs

Logs can be found on the target machine as follows:

  * Concourse Web
    * Standard Output Log: /usr/local/var/log/concourse/web-stdout.log
    * Standard Error Log: /usr/local/var/log/concourse/web-stderr.log
  * Concourse Darwin Worker
    * Standard Output Log: /usr/local/var/log/concourse/darwin-worker-stdout.log
    * Standard Error Log: /usr/local/var/log/concourse/darwin-worker-stderr.log
  * Concourse Linux Worker
    * Standard Output Log: /usr/local/var/log/concourse/linux-worker-stdout.log
    * Standard Error Log: /usr/local/var/log/concourse/linux-worker-stderr.log

## Manually Restarting Concourse Web / Darwin Worker / Linux Worker Instances

All concourse services are registered as LaunchAgents, so they can be stopped/started manually if necessary.

*Restart Concourse Web*

```
# Stop
launchctl unload ~/Library/LaunchAgents/com.pivotal.tokyo.concourse.web.plist

# Start
launchctl load ~/Library/LaunchAgents/com.pivotal.tokyo.concourse.web.plist
```

*Restart Concourse Darwin Worker*

```
# Stop
launchctl unload ~/Library/LaunchAgents/com.pivotal.tokyo.concourse.worker.darwin.plist

# Start
launchctl load ~/Library/LaunchAgents/com.pivotal.tokyo.concourse.worker.darwin.plist
```

*Restart Concourse Linux Worker*

```
# Stop
launchctl unload ~/Library/LaunchAgents/com.pivotal.tokyo.concourse.worker.linux.plist

# Start
launchctl load ~/Library/LaunchAgents/com.pivotal.tokyo.concourse.worker.linux.plist
```

# License

MIT License
