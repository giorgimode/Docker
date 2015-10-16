#!/bin/sh

USER=$1
DEPLOYER_INTERN_PASSWD=$2
DOMAIN=intern.poolingpeople.com

echo "Creating .htpasswd file..."
: ${DEPLOYER_INTERN_PASSWD:?"Need to set DEPLOYER_INTERN_PASSWD as ENV var non-empty"}
envsubst '${DEPLOYER_INTERN_PASSWD}:${DEPLOYER_INTERN_PASSWD}' < "./deployment/access/deployer.intern/htpasswd.tpl" > "./deployment/access/deployer.intern/.htpasswd"

echo "Deleting old context on server..."
ssh -t ${USER}@${DOMAIN} "rm -rf /home/${USER}/nginx-build"
scp -r ./deployment/ ${USER}@${DOMAIN}:/home/${USER}/nginx-build
echo "Building container on server..."
ssh -t ${USER}@${DOMAIN} "cd /home/${USER}/nginx-build/ && ./build.sh"
