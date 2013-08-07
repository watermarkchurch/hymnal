Hymnal: A digital songbook application
======================================

Hymnal is a web application for displaying song lyrics on mobile
devices. It is comprised of two parts: an admin section and a front end.
The admin section is for adding new songs, editing old songs, and
featuring songs to be displayed on the front end.

The front end shows the featured songs with their lyrics on a single page.
There is a link at the bottom of that page that provides a list of all
available songs in the database. Access control can be configured to
restrict access for copyright reasons.

Installation
------------

### Install Dependencies

This application was tested on:

* Ruby MRI v2.0.0
* PostgreSQL 9.2

You will need to configure an environment with these resources. Also, install
all of the bundled gems.

### Configuration

Once the environment is ready to go you will need to configure a few things in
the application:

* `config/database.yml` -- Configure the production database credentials
* `config/hymnal.rb` -- Set app specific configuration values (see the file for
  examples)
* `config/initializers/secret_token.rb` -- Generate your own with `rake secret`

### Setup

* Create database `RAILS_ENV=production bundle exec rake db:create db:migrate`
* Add an admin user `RAILS_ENV=production bundle exec rake hymnal:add_admin`

Development Setup
-----------------

### Setup Postgres Role

Install the PostgreSQL database on your development machine. Then run the
following commands:

```
$ psql postgres
> CREATE ROLE hymnal CREATEDB LOGIN;
```

Warning: This should not be used in production as it provides passwordless
access to your database!

### Setup Application

Now we need to install gem dependencies and setup the database.

```
$ bundle install
$ rake db:create db:migrate
```

### Run The Test Suite

The default rake task will run the tests:

```
$ bundle exec rake
```

Guard is also setup which will run the tests automatically as files are changed:

```
$ bundle exec guard
```

Contributing
------------

Please see CONTRIBUTING.md for details.

License
-------

Hymnal is ©2013 [Watermark Community Church](http://watermark.org) and
Travis Petticrew. It is free software and may be redistributed under the
terms specified in the LICENSE file.
