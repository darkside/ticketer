source 'http://rubygems.org'

gem 'rails', '3.0.9'
gem "haml-rails"
gem "inherited_resources"
gem "devise"

# Compass patched to play nice with God
gem "compass", :git => "git://github.com/darkside/compass.git"

gem "barista", ">= 0.5.0"
gem "json"
gem 'jquery-rails'
gem "formtastic"

gem "dark-capistrano-recipes" # deployment goodness

group :development do
  gem "rails3-generators", :git => "git://github.com/indirect/rails3-generators.git"
end

group :development, :test do
  gem 'mysql2', '~> 0.2.6'
  gem "rspec", ">=2.0.1"
  gem "factory_girl_rails", "~> 1.1" # factories
  gem "rspec-rails", ">=2.0.1"
  gem "remarkable", ">=4.0.0.alpha4"
  gem "remarkable_activemodel", ">=4.0.0.alpha4"
  gem "remarkable_activerecord", ">=4.0.0.alpha4"
  gem "capybara-envjs"
  gem "faker"
  gem "steak" # acceptance tests
end

group :production do
  gem "unicorn"
  gem "pg" # because i already have PG set up on darknode
end

