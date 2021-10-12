FROM ruby:2-alpine3.13

ADD . /ruby
WORKDIR /ruby

RUN apk --update add --virtual build_deps \
    build-base \
    libc-dev \
    linux-headers \
    cmake \
    && apk --no-cache add icu-dev openssl-dev \
    && gem build codeatlas-linguist-fork.gemspec \
    && gem install codeatlas-linguist-fork-7.15.0.gem \
    && apk del build_deps build-base libc-dev linux-headers cmake