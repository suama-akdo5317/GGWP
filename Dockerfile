FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       nodejs

RUN mkdir /ggwp
WORKDIR /ggwp

ADD Gemfile /ggwp/Gemfile
ADD Gemfile.lock /ggwp/Gemfile.lock

RUN bundle install

ADD . /ggwp

RUN mkdir -p tmp/sockets