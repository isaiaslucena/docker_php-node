#Steps

Remember that the folders path can be changed to one of your preference.

#Clone the git repo to the app folder
    git clone https://github.com/user/reponame.git ~/applications/website

#Before run the container:
1. Copy the .env.dist to .env
1. Change the settings on .env file
1. Change the host, user, password and database on file `config/database.php`

#Now run the container image (if you do not want watch the log, add the `-d` parameter to the folowing command)
    docker run --name website -v ~/applications/website:/app -p 80:80 --link "mysql5" isaiasneto/php-node
