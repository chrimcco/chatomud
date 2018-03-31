# Chatomud

* ruby 2.4.1

* rvm 1.29.3

* bundler 1.16.1

* mysql server 5.7.21

## SETUP

### rvm & ruby

First install rvm, the ruby version manager (https://github.com/rvm/ubuntu_rvm). rvm requires a login shell, so let's get that out of the way everytime that you hop onto the shell:

`/bin/bash --login`

Next:

`sudo apt-get install software-properties-common`

`sudo apt-add-repository -y ppa:rael-gc/rvm`

`sudo apt-get update`

`sudo apt-get install rvm`

Check that it is indeed installed with `rvm -v` after logging out and back in in the shell.

Once we are there, installing ruby is easy:

`rvm install ruby --latest`

`rvm list` this should output something like `ruby-x.x.x`

`rvm --default use x.x.x`

Finally, verify with `ruby -v`.

### install mysql

Next let's install your database server.

`sudo apt-get install mysql-server mysql-client libmysqlclient-dev`

You will be asked to choose a [root_password]. Remember it, and use it to access the mysql cli:

`mysql -u root -p`

When prompted, type in your [root_password]. Now that we are in, we create a user with all privileges on the databases. Possible values for [database] are `chatomud_development` and `chatomud_production`. [password] is the regular user password.

`GRANT ALL PRIVILEGES ON [database].* TO 'chatomud'@'localhost' IDENTIFIED BY '[password]';`

Next we flush, and we are done:

`flush privileges;`

`exit`

### Get the code

I am going to assume you have git installed in your system, so go ahead and clone the project:

`git clone https://github.com/chatomud/chatomud`

`cd chatomud`

### bundler

You need bundler next. `gem` has been installed along with ruby, so do:

`gem install bundler`

and as always verify with `bundler -v`. If OK, bundle up:

`bundle`

### Seed the data

To populate your database with the starting data run one of the following, [environment] is either `production` or `development`:

`DATABASE_PASSWORD=[password] RAILS_ENV=[environment] ./recreate_db.sh`

This may take a while. Finally start the engine with:

`DATABASE_PASSWORD=[password] bundle exec rails s -e production &> exception_output &`

`DATABASE_PASSWORD=[password] bundle exec rails s -e development &`

For the production environment we are redirecting error output to a file called `exception_output` you can refer to in the event of a crash. All other logs are kept under `log/[environment]`.

Unless something went wrong you can now connect to the mud under port 1234.

## Hosting

If you want to host this somewhere like digital ocean, chances are you were just given root access. To create a regular user to deploy chatomud, first jump in as root:

`ssh root@xxx.xxx.xxx.xxx`

I'm assuming you know about public/private keys and that your public one was set in the host machine by your provider. If it isn't, you should still be able to get access with the password you should have been provided with.

Add a user next:

`adduser chatomud`

Type and retype the password, ignore the rest of questions. Next grant the user sudo privileges, as you may still need to run commands as sudo by prepending them with `sudo` and providing the root password:

`usermod -aG sudo chatomud`

With that done, you can switch to your newly created user:

`su chatomud`

