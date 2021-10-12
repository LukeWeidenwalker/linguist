FROM ruby:2-alpine3.13

ADD . /ruby
WORKDIR /ruby

RUN apk --update add --virtual build_deps \
    build-base \
    libc-dev \
    linux-headers \
    cmake \
    git \
    apk --no-cache add icu-dev openssl-dev \
    && script/bootstrap \
    && bundle exec rake samples \
    && gem build codeatlas-linguist-fork.gemspec \
    && gem install codeatlas-linguist-fork-7.16.1.gem \
    && apk del build_deps build-base libc-dev linux-headers cmake