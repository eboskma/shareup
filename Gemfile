source 'https://rubygems.org'

gem 'rails', '~> 4.0.3'

gem 'pg', '~> 0.17.1'
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.0'

# Use HAML
gem 'haml', '~> 4.0.5'
gem 'haml-rails', '~> 0.5.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
gem 'oj', '~> 2.6.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Authentication
gem 'devise', '~> 3.2.3'
gem 'omniauth', '~> 1.2.1'
gem 'omniauth-twitter', '~> 1.0.1'
gem 'uuidtools', '~> 2.1.4'

# Livereload
group :development do
  gem 'guard-livereload', '~> 2.1.1', require: false
  gem 'rack-livereload', '~> 0.3.15'
end

# Spring for faster rails commands
group :development do
  gem 'spring', '~> 1.1.0'
  gem 'spring-commands-rspec', '~> 1.0.1'
end

group :test do
  gem 'rspec-rails', '~> 2.14.1'
  gem 'guard-rspec', '~> 4.2.5'
  gem 'poltergeist', '~> 1.5.0'
  gem 'capybara', '~> 2.2.1'
  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'faker', '~> 1.2.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'rb-fsevent', '~> 0.9.4', require:  false if RUBY_PLATFORM =~ /darwin/i
  gem 'diff-lcs', '~> 1.1.3'
  gem 'fuubar', '~> 1.3.2'
  gem 'rspec-expectations', '~> 2.14.0'
  gem 'rspec-mocks', '~> 2.14.0'
  gem 'listen', '~> 2.1'
end