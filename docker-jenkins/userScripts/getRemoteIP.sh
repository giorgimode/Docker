#!/bin/bash

echo
echo "Getting IP of remote application..."
echo "Requested container: ${1}"
echo "Container file: ${2}"
IP_FILE=${2}
IP=$(curl -v -X GET http://172.17.42.1:5555/containers/${1}/json 2>&1)
IPAddress=$(echo $IP | sed -e 's/[{}]/''/g' | awk -v RS=',"' -F: '/^IPAddress/ {print $2}' | sed 's/\(^"\|"$\)//g')
echo "IP is: ${IPAddress}"
echo ${IPAddress} > ${WORKSPACE}/${IP_FILE}
sleep 5s
# curl -H Accept:application/json -H Content-Type:application/json -H x-not-registered:cc21735a-214d-449d-a407-995d79c75268 -v http://${IPAddress}:8080/rest/people/cc21735a-214d-449d-a407-995d79c75268