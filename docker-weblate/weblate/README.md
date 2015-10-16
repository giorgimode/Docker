# weblate-docker

https://docs.weblate.org/en/latest/admin/deployments.html#weblate-and-docker  
https://docs.weblate.org/en/latest/admin/deployments.html#docker  
https://docs.weblate.org/en/weblate-2.4/admin/install.html#production-hosts  

To make changes to weblate docker image, rebuilt and re-run, first we need to kill and exterminate running docker container and image:  
1. ``` cd /path/docker-weblate ```
2. ``` sudo docker stop [weblate-container-id] [memcached-container-id] [postgres-container-id] ```
3. ``` sudo docker rmi -f dockerweblate_weblate memcached:1.4 postgres:9.4 ``` 
4. ``` sudo docker-compose kill ```
5. ``` sudo docker-compose rm ```

####Use steps from the parent directory to rebuilt and rerun docker.  

----------------------------------
Weblate is accessible on port 8000 of the container  

----------------------------------

###SSH keys
https://docs.weblate.org/en/weblate-2.4/admin/continuous.html#github-setup  

1. go to http://weblateURL/admin/ssh
2. add github.com to known hosts
3. add generated ssh-rsa to public keys of github account

###Hooks
1. Go to github.com/username/myrepo/settings/hooks  
2. Add service -> Weblate  

You can set the base URL of your Weblate installation (for example https://translate.intern.poolingpeople.com) and Weblate will be notified about every push to GitHub repository.  
You can use generic Webhook, in that case the Payload URL would have to be full path to the handler, for example https://translate.intern.poolingpeople.com/hooks/github/  
