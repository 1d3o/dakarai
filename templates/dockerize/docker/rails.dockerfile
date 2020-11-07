FROM ruby:2.6.0

# Installo dipendenze
RUN apt-get update -qq && apt-get install -y apt-utils build-essential

COPY . /app
WORKDIR /app

RUN test -f tmp/pids/server.pid && rm -f tmp/pids/server.pid; true
RUN gem install bundler:2.0.2
RUN gem update --system
RUN bundle config --local disable_platform_warnings true
RUN bundle install
