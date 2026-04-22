## 1. Environment

- Ruby 4.0.3

## 2. Install Gems via Gemfile and Bundler

```command
$ bundle config set path vendor/bundle
$ bundle install
$ bundle lock --add-checksums
```

## 3. Bulk Execution of Unit Tests

```command
$ cd ./ruby
$ rake
Run options: --seed 32524

# Running:

..

Finished in 0.022878s, 87.4189 runs/s, 87.4189 assertions/s.

2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```
