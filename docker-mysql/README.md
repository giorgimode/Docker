###Tips
Use your own database(s) with url  
`docker run -d -p 3306:3306 -e url="http://www.example.org/my/database.sql" mysqldb`

Define user with user and password (default - read rights)  
`docker run -d -p 3306:3306 -e user="Nane" -e password="meins" mysqldb`

Change access rights with full access for user Me:  
`docker run -d -p 3306:3306 -e user="Me" -e password="mine" -e right="WRITE" mysqldb`