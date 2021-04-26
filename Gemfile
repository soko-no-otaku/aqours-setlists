source 'https://rubygems.org'

ruby '~> 2.7.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development
gem 'pg', group: :production # for heroku
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Bootsnap boots large Ruby/Rails apps faster
gem 'bootsnap', require: false

# Use Slim as the template engine
gem 'slim-rails'
# ActsAsList provides the capabilities for sorting and reordering songs in a setlist
gem 'acts_as_list'
# Cocoon makes it easier to handle nested forms
gem 'cocoon'
# Use jQuery as the JavaScript library
gem 'jquery-rails'
# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'
# Materialize Sass version for Rails Asset Pipeline
gem 'materialize-sass', '~> 1.0.0'
# A tagging plugin for Rails applications
gem 'acts-as-taggable-on', git: 'https://github.com/mbleigh/acts-as-taggable-on'
# Geocoder adds geocoding by street address
gem 'geocoder'
# The leaflet.js map display library for your Rails 4/5 application
gem 'leaflet-rails'
# A lightweight plugin that logs impressions per action or manually per model
gem 'impressionist'
# Advanced seed data handling for Rails
gem 'seed-fu', '~> 2.3'
