source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
gem 'rails-i18n', '~> 4.0.0' # For 4.0.x
gem 'rails_12factor', group: :production

gem 'quiet_assets'
gem 'pg'
gem 'newrelic_rpm'
gem 'foreman'
gem 'passenger'
gem 'thor'
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.1'
gem 'iconv'


# API
gem 'grape', github: 'intridea/grape'
gem 'grape-entity'
gem 'grape-swagger'

gem 'devise'
gem 'carrierwave'
gem 'axlsx', '~> 2.0.1'



# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'
gem 'slim'
gem 'slim-rails'
gem 'font-awesome-rails'
gem 'bower-rails'
gem 'neat'
gem 'bourbon'
gem 'bitters'
gem 'refills'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-sass-rails'


# Turbolinks makes following links in your web application faster. 
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


gem 'fabrication'
gem 'faker'
gem 'fog'

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :development do
  gem 'ruby_gntp'
  gem 'rails-footnotes', '>= 4.0.0', '<5'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'
end
  


group :production do
  gem 'exception_notification'
  gem 'roo' # Used for the Excel import
end
