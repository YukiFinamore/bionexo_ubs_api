# Bionexo Ubs Api

The purpose of project is permit to user load an CSV file with all Ubs's from Brazil, save on database and through filters, user geolocations and user navigation map, get the infos and respond a json file to react app that render and show this infos to user.

You can access the React App [here](https://github.com/YukiFinamore/bionexo_ubs)

## Installing

Clone the project on your directory with this command line:

```
git clone git@github.com:YukiFinamore/bionexo_ubs_api.git
```

## Starting with Rails

This project works with:
* Rails 5.2 onwards. - [installation guide](http://railsapps.github.io/installing-rails.html)
* Ruby 2.6.3 - [installation guide](https://www.ruby-lang.org/en/documentation/installation/)
* Postgres Database - [installation guide](https://www.postgresql.org/download/)
* Bundle 2.1.4

After make sure this prerequisites are installed and configured, inside the directory project, run on your terminal: (Skip this step if you already have bundler installed)
After install the project dependecies. Open the terminal and run (inside the project directory): 

```
gem install bundler
```

Install gems dependencies:

```
bundle install
```

After that, config your `config/database.yml` file:

```
default: &defaults
  adapter: postgresql
  host:     [YOUR_DATABASE_HOST]
  username: [YOUR_DATABASE_USERNAME]
  password: [YOUR_DATABASE_PASSWORD]
  encoding: utf8
  min_messages: warning
  pool: 2
  timeout: 5000

development:
  <<: *defaults
  adapter: postgresql
  database: bionexo_ubs_development

test:
  <<: *defaults
  adapter: postgresql
  database: bionexo_ubs_test

production:
  <<: *defaults
  adapter: postgresql
  database: bionexo_ubs_production

  staging:
  <<: *defaults
  adapter: postgresql
  database: bionexo_ubs_staging
  
```

After config your database file, you can run the project with this command line on your terminal:


```
rails s
```

With your project working, create your database with this command line on your terminal

```
bundle exec rake db:create
```

If you got success message, run:

```
bundle exec rake db:migrate
````

## Starting with Docker

This project works with:
* Docker 2.2.0.3 - [installation guide](https://hub.docker.com/search?q=&type=edition&offering=community&sort=updated_at&order=desc)

Docker is already configured by default, but if you want more infos how to config your Rails project with docker you can follow my guide: [Configuring Docker on Your Rails Project](https://gist.github.com/YukiFinamore/e522886fa5cba2fa534654666eefc956)

After make sure docker are installed, you want to create your own `.env` file on root project directory. You can get an example file with `.env.sample` name.

Inside your own `.env` file, update this lines with your posgres config:

```
POSTGRES_HOST=[YOUR_POSTGRES_HOST]
POSTGRES_USER=[YOUR_POSTGRES_USER]
POSTGRES_PASSWORD=[YOUR_POSTGRES_PASSWORD]
```

With `.env` configured, we need to build docker to install all project dependencies, run on your terminal:

```
docker-compose build
```

If you get success message, run:

```
docker-compose up
```

And then: 

```
docker-compose run [PROJECT_NAME_SERVICE] bundle exec rake db:migrate
```

In our case:

```
docker-compose run bionexo_ubs_api bundle exec rake db:migrate
```

## Getting Started

With the project running, access on your browser [localhost](http:localhost:3000) (Default localhost)
You will see an input field to upload an CSV file.
Upload the file that is on the root directory of the project with name: default_hospitals.csv

Upload the file and import them.

That's all :)
You populate your database with all Ubs's around Brazil.

## Authors

* **Yuki Finamore** - [github](https://github.com/YukiFinamore)