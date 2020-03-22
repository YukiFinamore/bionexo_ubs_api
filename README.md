# Bionexo Ubs Api

The purpose of project is permit to user load an CSV file with all Ubs's from Brazil, save on database and through filters, user geolocations, get this infos and respond a json file to react app that render and show this infos to user.

You can access the Reac App [here](https://github.com/YukiFinamore/bionexo_ubs)

## Installing

Clone the project on your directory with this command line:

```
git clone git@github.com:YukiFinamore/bionexo_ubs_api.git
```

## Starting with Rails?

This project works with:
* Rails 5.2 onwards. [installation guide](http://railsapps.github.io/installing-rails.html)
* Ruby 2.6.3 [installation guide](https://www.ruby-lang.org/en/documentation/installation/)
* Postgres Database [installation guide](https://www.postgresql.org/download/)
* Bundle 2.1.4

After make sure this prerequisites are installed and configured, inside the directory project, run on your terminal: (Skip this step if you already have bundler installed)
```
gem install bundler
```

After that run:
```
bundle install
```

Run the project with:

```
rails s
```

After that, config your `config/database.yml` file, if their doesn't exist, create them on `config` folder and setup them like this:

```
default: &defaults
  adapter: postgresql
  host:     example: localhost
  username: example: root
  password: example: root
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

After config your database file, create yout database with this commandline on your terminal:

```
bundle exec rake db:create
```

If you got success message, run:

```
bundle exec rake db:migrate
````

## Starting with Docker?

This project works with:
* Docker 2.2.0.3 [installation guide](https://hub.docker.com/search?q=&type=edition&offering=community&sort=updated_at&order=desc)

Configuring Docker Files:
You can follow my guide to config Docker on your rails Project: [Configuring Docker on Your Rails Project](https://gist.github.com/YukiFinamore/e522886fa5cba2fa534654666eefc956)

After make sure docker are installed and configured, inside the directory project, run on your terminal: 

```
docker-compose build
```

If you get success message, run:

```
docker-compose up
```

And then: 

```
docker-compose run `project_name_service` bundle exec rake db:migrate
```

Like:

```
docker-compose run bionexo_ubs_api bundle exec rake db:migrate
```

## Getting Started

With the project running, access on your browser [localhost](http:localhost:3000) (Default localhost)
On your root path (first screen) you will see an input field to upload an CSV file, you can get the CSV on 
[this site](http://www.dados.gov.br/dataset/ubs_funcionamento) or in your root directory, a file with name: `default_hospitals.csv`.

Upload this file on input and save them.

That's all :)
You loaded your database with all Ubs's around Brazil.

## Authors

* **Yuki Finamore** - [github](https://github.com/YukiFinamore)