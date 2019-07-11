##Steps

Remember that the folders path can be changed to one of your preference.

###First create the mysql container
    docker run -d --restart=always --name mysql5 -v ~/applications/mysql/data:/var/lib/mysql -v ~/applications/mysql/conf.d:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=folha_prod -e MYSQL_USER=folhadirigida -e MYSQL_PASSWORD=folhadirigida -p 3306:3306 mysql:5.6

###Create the container image
    docker build --no-cache --force-rm -t fdonline/php-node .

####Clone the git repo to the app folder
    git clone https://github.com/fd-online/website-folhadirigida.git ~/applications/website

####Before run the container:
1. Copy the .env.dist to .env
1. Change the settings on .env file
1. Change the host, user, password and database on file `config/database.php`

####Now run the container image (if you do not want watch the log, add the `-d` parameter to the folowing command)
    docker run --name website -v ~/applications/website:/app -p 80:80 --link "mysql5" fdonline/php-node

###Verify if the http server log
    docker logs website