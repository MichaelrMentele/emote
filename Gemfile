source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.6'

### Assets ###
gem 'bootstrap-sass' # Bootstrap styles
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'coffee-rails'
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'bootstrap_form' # Bootstrap styles/errors on model forms
gem 'haml-rails' # Compile haml

### App ###
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'sdoc', '~> 0.4.0', group: :doc # bundle exec rake doc:rails generates the API under doc/api.
gem 'bcrypt', '~> 3.1.7' # Use ActiveModel has_secure_password for password hashing
gem 'sidekiq' # background processes
gem 'stripe' # payment processing
gem 'figaro' # sensitive info management

group :development, :test do
  gem 'pry'     # debugger
  gem 'pry-nav'
  gem 'rspec-rails'
  gem 'fabrication'
  gem 'faker'
  gem 'sqlite3' # database
end

group :test do 
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'capybara'
  gem 'capybara-email'
  gem 'launchy'
  gem 'selenium-webdriver'
end

group :development do
  gem 'thin'
  gem 'better_errors'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do 
  gem 'pg'    # Postgres
  gem 'puma'  # concurrent server
  gem 'sentry-raven' # error aggregator
end
