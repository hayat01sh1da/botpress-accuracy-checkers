FROM ruby:3.3.5

# Install Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev libvips libvips-dev vim tree

WORKDIR /tmp

# Setup Bundler
RUN gem install bundler && gem update --system

WORKDIR /app

# Bundle Install
RUN bundle config set path vendor/bundle
COPY .ruby-version Gemfile Gemfile.lock ./
RUN bundle install

# Remove the Remaining Process Files
RUN rm -rf tmp/pids/server.pid

CMD ["./bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
