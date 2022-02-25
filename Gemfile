# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "activeadmin"
gem "bootsnap", ">= 1.4.4", require: false
gem "cancancan"
gem "devise"
gem "fx"
gem "hotwire-rails"
gem "jbuilder", "~> 2.7"
gem "kaminari"
gem "logidze"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.4", ">= 6.1.4.4"
gem "ransack"
gem "redis"
gem "redis-rails"
gem "rubycritic"
gem "sass-rails", ">= 6"
gem "sidekiq"
gem "sidekiq-cron"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "database_cleaner"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "shoulda-matchers"
end

group :test do
  gem "simplecov", require: false
end

group :development do
  gem "annotate"
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
