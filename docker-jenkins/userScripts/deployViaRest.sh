#!/bin/bash

# call ${JENKINS_HOME}/userScripts/deployViaRest.sh in jenkins
IMAGE_NAME=$1
echo "Images name: ${IMAGE_NAME}"
echo "Building container via REST... "
curl -v -X POST --data-binary "@${WORKSPACE}/deployment.tar.gz" --header 'Content-Type: application/x-tar' --dump-header - --no-buffer http://172.17.42.1:5555/build?t="${IMAGE_NAME}"
exit 0