# weblate-docker

Docker container for Weblate
Documentation is available in Weblate documentation:

https://docs.weblate.org/en/latest/admin/deployments.html#docker 

Use sudo if permission denied or other unexpected error:  
1. docker-compose build  
2. docker-compose run weblate migrate  
3. docker-compose run weblate collectstatic  
4. docker-compose run weblate createadmin  
5. docker-compose up

To Install docker-compose ([Detailed Instructions!](https://github.com/docker/compose/releases)):  
```
curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose  
chmod +x /usr/local/bin/docker-compose`   
```

If Permission Denied on curl command, alternative:  
```
sudo bash -c "https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
```

##### Exposed Ports in container: 8000