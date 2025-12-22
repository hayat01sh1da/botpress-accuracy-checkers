FROM ruby:3.4.8

# Packages
RUN apt-get update && apt-get install -y curl build-essential libpq-dev libvips libvips-dev vim tree

WORKDIR /tmp

# Bundler
RUN gem install bundler -v 4.0.1

WORKDIR /app

# RubyGems
COPY .ruby-version Gemfile Gemfile.lock ./
ENV BUNDLE_GEMFILE=/app/Gemfile
ENV BUNDLE_PATH=/app/vendor/bundle
ENV BUNDLE_FROZEN=true
RUN bundle install

EXPOSE 3000
CMD ["bash"]
