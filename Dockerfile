FROM ruby:2.6.3

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev libqt4-dev xvfb imagemagick --fix-missing --no-install-recommends

ENV INSTALL_PATH /bionexo_ubs_api
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . .

VOLUME ["$INSTALL_PATH/public"]
CMD bundle exec puma