FROM ruby:2.7.0-alpine

RUN apk add --no-cache \
  build-base \
  busybox \
  ca-certificates \
  curl \
  git \
  gnupg1 \
  graphicsmagick \
  graphviz \
  libffi-dev \
  libsodium-dev \
  nodejs \
  openssh-client \
  openssl \
  postgresql-client \
  postgresql-dev \
  rsync \
  sqlite \
  sqlite-dev \
  tzdata \
  yarn

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /opt/app

ADD Gemfile /opt/app/Gemfile
ADD Gemfile.lock /opt/app/Gemfile.lock
RUN bundle install
ADD . /opt/app

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

