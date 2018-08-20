# [OMiLab](http://omilab.org) Deployment via Vagrant

Provision of a virtual machine with OS, Tomcat and database for the dynamic deployment.
## Requirements
- Vagrant: [https://vagrantup.com](https://vagrantup.com)
- Virtualbox: [https://virtualbox.org](https://virtualbox.org)

## VM configuration
- OS: ubuntu 16.04
- Portforwards: 
    - 80 to 6000
    - 8080 to 6080
- Logs of the tomcat will be synced in logs\
- configs\ will be synced to the \home\vagrant\configs

## Provision Scripts
Shell commands for box installation:
- Commands
    - Updates the OS
    - Installs mysql and jdk
    - Installs tomcat8 and copies tomcat configration
    - Restarts tomcat service

- Database
    - SQL for each microservice database is stored in configs\sql\ *servicename*
    - Creates database, imports schema, creates user and grants permission

- Build (*optional*)
    - Creates a workspace
    - Checkouts the repository from [DKE GitLab](https://gitlab.dke.univie.ac.at/explore)
    - Build the binaries with maven
    - Copy the WAR-files to the tomcat\webapps

## Execution
- Browse to the checked-out directory
- *vagrant up* starts up the virtual machine
- *vagrant ssh* allows the SSH Login for further adaptation to the virtual machine
- *vagrant destroy* will delete the virtual machine