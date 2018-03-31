## Chatomud

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
sudo apt-get install mysql-server
sudo apt-get install ruby-dev
sudo apt-get install mysql-client libmysqlclient-dev
(how to autoset root password?)
gem install haml

SHOT_DATABASE_PASSWORD=t00r rails s -e production &> exception_output

mysql -u root -p t00r

bundle exec rails s




