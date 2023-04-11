FROM ruby:2.7.8
MAINTAINER "Watermark Dev <dev@watermark.org>"

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list; \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && apt-get install --fix-missing -y \
  build-essential \
  locales \
  postgresql-client-12 \
  nodejs

ENV BUNDLE_GEMFILE=/app/Gemfile \
  BUNDLE_JOBS=20 \
  BUNDLE_PATH=/bundle

RUN mkdir /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
WORKDIR /app

RUN gem install bundler -v 2.4.11

RUN bundle install

ENV PATH="/app/bin:${PATH}"

CMD ["rspec"]

ADD . /app
