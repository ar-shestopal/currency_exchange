# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'capybara/rspec'
require 'database_cleaner'

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

# Set the Capybara Javascript driver to capybara-webkit
Capybara.register_driver(:webkit) do |app|
  Capybara::Webkit::Driver.new(app).tap(&:block_unknown_urls)
end
Capybara.javascript_driver = :webkit
Capybara.default_wait_time = 15
require 'rack/utils'
Capybara.app = Rack::ShowExceptions.new(CurrencyExchange::Application)

RSpec.configure do |config|
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # This must be disabled for drivers which run in their own thread, such as
  # Capybara-Webkit.
  config.use_transactional_fixtures = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Clean up the Test Database
  # Before the entire test suite runs, clear the test database out completely
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, pre_count: true)

    begin
      DatabaseCleaner.start
      factories_to_lint = FactoryGirl.factories.reject do |factory|
        %i(user documentation_user documentation_user_complete)
        .include?(factory.name)
      end
      FactoryGirl.lint(factories_to_lint)
    ensure
      DatabaseCleaner.clean
    end
  end

  # Sets the default database cleaning strategy to be transactions === fast
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # Capybara tests run in a test server process so transactions won't work
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  # Standard config to run DatabaseCleaner
  config.before(:each) do
    DatabaseCleaner.start
    ActionMailer::Base.deliveries = []
  end

  # Clean up after each execution
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

module Support
  module ModelsHelpers
  end
end

RSpec.configure do |config|
  config.include Support::ModelsHelpers, type: :model
end
