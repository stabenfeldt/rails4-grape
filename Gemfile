source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
gem 'rails-i18n', '~> 4.0.3' # For 4.0.x
gem 'rails_12factor', group: :production

gem 'quiet_assets', '>= 1.0.3'
gem 'pg'
gem 'newrelic_rpm'
gem 'foreman', '>= 0.86.0'
gem 'passenger'
gem 'thor', '>= 1.4.0'
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.1'
gem 'iconv'


# API
gem 'grape', github: 'intridea/grape'
gem 'grape-entity'
gem 'grape-swagger'

gem 'devise', '>= 3.3.0'
gem 'carrierwave'
gem 'axlsx', '~> 2.0.1'



# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.4'
gem 'slim'
gem 'slim-rails', '>= 2.1.5'
gem 'font-awesome-rails', '>= 4.2.0.0'
gem 'bower-rails'
gem 'neat', '>= 1.6.0'
gem 'bourbon', '>= 3.2.4'
gem 'bitters', '>= 0.10.1'
gem 'refills'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 3.1.1'
gem 'jquery-ui-sass-rails'


# Turbolinks makes following links in your web application faster. 
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '>= 2.2.2'

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
  gem 'rspec-rails', '>= 2.99.0'
  gem 'guard-rspec', '>= 4.2.9', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request', '>= 0.4.0'
end

group :development do
  gem 'ruby_gntp'
  gem 'rails-footnotes', '>= 4.0.1', '< 5'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara', '>= 2.3.0'
  gem 'launchy'
  gem 'selenium-webdriver'
end
  


group :production do
  gem 'exception_notification'
  gem 'roo' , '>= 2.0.0' # Used for the Excel import
end
