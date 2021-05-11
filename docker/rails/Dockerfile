FROM ruby:2.6.3

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  vim

#各自のアプリ名に変更する
ENV RAILS_ROOT /ggwp

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler:2.1.4
RUN bundle install

#プロジェクトフォルダ内のすべてのファイルをRailsコンテナ内にコピーする
COPY . .

#ソケット通信のためのディレクトリを作成
RUN mkdir -p tmp/sockets
