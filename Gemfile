source 'https://rubygems.org'
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem 'haml-rails'
gem 'static_model'
gem 'foreigner'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'rspec-rails', '3.3.2'
  gem 'byebug'
  gem 'capybara', '2.4.4'
  gem 'launchy'
  gem 'ZenTest', '4.11.0'
  gem 'database_cleaner', '1.4.1' # required by Cucumber
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # basic imperative step defs
  gem 'simplecov', :require => false
end

group :development do
  #Switch project to haml
  gem 'erb2haml'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  #Make sure the following gems are in production
  gem 'pg'              # PostgreSQL in prod
  gem 'rails_12factor'  # Heroku-specific production settings
  gem "activerecord-postgresql-adapter"
  
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'turbolinks'