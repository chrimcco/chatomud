## Chatomud

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
sudo apt-get install ruby-dev
(how to autoset root password?)
gem install haml


I am going to assume you have git installed in your system, so go ahead and clone the project:

`git clone https://github.com/chatomud/chatomud`

Next let's set up your databases.

`sudo apt-get install mysql-server mysql-client libmysqlclient-dev`

You will be asked to choose a [root_password]. Remember it, and use it to access the mysql cli:

`mysql -u root -p`

When prompted, type in your [root_password].

Once we are in, we create a user with all privileges on the databases. Possible values for [database] are `chatomud_development` and `chatomud_production`. [password] is the regular user password.

`GRANT ALL PRIVILEGES ON [database].* TO 'chatomud'@'localhost' IDENTIFIED BY [password];`

Next we flush, and we are done:

`flush privileges;`

`exit`

To populate your database with the starting data run one of the following, [environment] is either `production` or `development`:

`DATABASE_PASSWORD=[password] RAILS_ENV=[environment] ./recreate_db.sh`

This may take a while. Finally start the engine with:

`DATABASE_PASSWORD=[password] bundle exec rails s -e production &> exception_output`

`DATABASE_PASSWORD=[password] bundle exec rails s -e development`

For the production environment we are redirecting error output to a file called `exception_output` you can refer to in the event of a crash. All other logs are kept under `log/[environment]`.
