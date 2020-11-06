FROM ruby:2.6.6

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  default-libmysqlclient-dev \
  libssl-dev \
  libpq-dev \
  sudo \
  nginx && \
  gem install bundler:2.0.1

RUN bundle install

ADD . /app
RUN mkdir -p tmp/sockets
RUN mkdir tmp/pids
