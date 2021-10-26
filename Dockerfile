FROM ruby:2.7

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && apt-get update \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential \
  libpq-dev \
  nodejs \
  yarn

WORKDIR /drtr-app
COPY . /drtr-app
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install