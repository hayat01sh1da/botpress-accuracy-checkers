FROM ruby:3.4.7

# Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev libvips libvips-dev vim tree

WORKDIR /tmp

# Bundler
RUN gem install bundler && gem update --system

WORKDIR /app

# RubyGems
RUN bundle config set path vendor/bundle
COPY .ruby-version Gemfile Gemfile.lock ./
RUN bundle config set force_ruby_platform true

EXPOSE 3000
CMD ["bash"]
