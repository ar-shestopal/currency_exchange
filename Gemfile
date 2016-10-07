source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#UX
gem 'bootstrap-sass'

group :development do
  gem 'listen'
end

group :test do
  # Rails rspec matchers
  gem 'shoulda-matchers', '~> 2.8.0'
  # Generate test coverage statistics
  gem 'simplecov', '~> 0.10.0', require: false
  # Integration testing
  gem 'capybara', '~> 2.4.4'
  # Ensure a clean state for testing
  gem 'database_cleaner', '~> 1.4.1', require: false
  # Capybara driver for headless WebKit for testing Javascript
  gem 'capybara-webkit', '~> 1.6.0'
  # Sends simplecov results to codeclimate.com
  gem 'codeclimate-test-reporter', '~> 0.4.7', require: false
end

group :development, :test do
  # Makes pry the default Rails console
  gem 'pry-rails', '~> 0.3.4'
  # Adds control execution to pry
  gem 'pry-byebug', '3.1.0'
  # Testing framework
  gem 'rspec-rails', '~> 3.2'
  # Spring claims to speeds up development
  gem 'spring', '~> 1.3'
  # Spring-Rspec integration
  gem 'spring-commands-rspec', '~> 1.0'
  # Setting up Ruby objects as test data
  gem 'factory_girl_rails', '~> 4.5'
end
