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

Simple Installation with Heroku
-------------------------------

Hymnal is super easy to deploy to Heroku. You can have your own instance
up and going in less than 10 minutes!

### Prerequisites

* Create an Heroku account
* Install the `heroku-tools` package
* Install `git`
* Clone this repo!

### Configure It!

Run these commands in the cloned repo directory:

```
$ heroku apps:create
$ heroku config:set HYMNAL_BRAND="My Awesome App"
$ heroku config:set HYMNAL_ALLOW_ACLS="0.0.0.0/0"
```

Note: The `HYMNAL_ALLOW_ACLS` above allows access from all addresses.
Change this value to whatever makes sense for your deployment. See the
"Access Control" section below.

### Deploy It!

Let's get this thing out there already!

```
$ git push heroku master
$ heroku run rake db:migrate
```

Traditional Installation
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
* `.env` -- Set app specific configuration values (see the file for
  examples)
* `config/initializers/secret_token.rb` -- Generate your own with `rake secret`

### Setup

* Create database `RAILS_ENV=production bundle exec rake db:create db:migrate`
* Add an admin user `RAILS_ENV=production bundle exec rake hymnal:add_admin`

Access Control
--------------

Hymnal provides flexible access control so you can be as strict or as
permissive as you'd like. Access is controlled by 3 environment
variables:

* `HYMNAL_ALLOW_ACLS` - Comma separated list of allowed IP ranges.
* `HYMNAL_DENY_ACLS` - Comma separated list of denied IP ranges.
* `HYMNAL_PASSWORD` - Plain text password allowing user to bypass ACL
  checks.

### Just Give me Some Examples!

**Give access to everyone, but a specific address.**
```
HYMNAL_ALLOW_ACLS="0.0.0.0/0"
HYMNAL_DENY_ACLS="123.456.678.90/32"
```

**Give access to just local networks**
```
HYMNAL_ALLOW_ACLS="127.0.0.1/32,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"
```

**Give access to just a block of addresses, but give password option**
```
HYMNAL_ALLOW_ACLS="123.456.789.10/28"
HYMNAL_PASSWORD="hymn41"
```

Note: If you are using the Heroku deployment option all you have to do
is prefix these commands with `heroku config:set` to set the
configuration and then run `heroku restart` to apply the changes.

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
