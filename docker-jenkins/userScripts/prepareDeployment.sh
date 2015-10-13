#!/bin/bash

echo
echo "Preparing deployment..."

PATH_TO_WAR=$1

USER_SCRIPTS=${HELPER_SCRIPTS}/userScripts
USER_TEMPLATES=${HELPER_SCRIPTS}/userTemplates
CURRENT_WORKSPACE=`pwd`
READY_FOR_DEPLOYMENT_OUTPUT=${CURRENT_WORKSPACE}/deployment
DEPLOYMENT_TAR=${CURRENT_WORKSPACE}/deployment.tar.gz
WAR_FILE_LOCATION=${CURRENT_WORKSPACE}/${PATH_TO_WAR}/*.war

echo "User scripts are in ${USER_SCRIPTS}"
echo "User templates are in ${USER_TEMPLATES}"
echo "Ready for deployment output is in: ${READY_FOR_DEPLOYMENT_OUTPUT}"
echo "Current workspace is: ${CURRENT_WORKSPACE}"
echo "Expecting war file in: ${WAR_FILE_LOCATION}"

# TODO check existance of needed folders and files


# check if deployment directory exists from previous build, then remove it
if [ -d "${READY_FOR_DEPLOYMENT_OUTPUT}" ] ; then
  echo "Removeing old deployment folder"
  rm -rf ${READY_FOR_DEPLOYMENT_OUTPUT}
fi

# create deployment folder
mkdir ${READY_FOR_DEPLOYMENT_OUTPUT}

# copy template files into deployment folder
echo "Copying template files for wildfly..."
cp -v ${USER_TEMPLATES}/wildfly/* ${READY_FOR_DEPLOYMENT_OUTPUT}

# copy war files
# TODO check existance
echo "Copying war file..."
cp -v ${WAR_FILE_LOCATION} ${READY_FOR_DEPLOYMENT_OUTPUT}


echo "Creating deployment.tar.gz..."

if [ -f "${DEPLOYMENT_TAR}" ] ; then
  echo "Removing old deployment tar..."
  rm ${DEPLOYMENT_TAR}
fi

cd ${READY_FOR_DEPLOYMENT_OUTPUT}
tar cvfz ${DEPLOYMENT_TAR} .
cd ${CURRENT_WORKSPACE}