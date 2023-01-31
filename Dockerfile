FROM ruby:3.1.3

# Ensure node.js 19 is available for apt-get
RUN curl -sL https://deb.nodesource.com/setup_19.x | bash -

# Install dependencies
RUN set -ex && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends sudo && \
    apt-get install -y --no-install-recommends postgresql-client && \
    apt-get install -y --no-install-recommends build-essential && \
    apt-get install -y --no-install-recommends libvips && \
    apt-get install -y --no-install-recommends nodejs && \
    apt-get install -y --no-install-recommends graphviz && \
    : "Install Yarn..." && \
    npm install -g yarn && \
    : "Cleaning..." && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /microblog

COPY Gemfile /microblog/Gemfile
COPY Gemfile.lock /microblog/Gemfile.lock
# COPY package.json /microblog/package.json
# COPY yarn.lock /microblog/yarn.lock

# RUN yarn install --check-files

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN bundle install