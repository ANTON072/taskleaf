source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bootsnap", require: false
gem "sassc-rails"
gem "slim-rails"
gem "bootstrap", "4.6.2"
gem "bcrypt"
gem "rails_autolink"
gem "ransack"
gem "image_processing", ">= 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 6.0.0'
  gem "factory_bot_rails"
end

group :development do
  gem "web-console"
  gem "mailcatcher"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
