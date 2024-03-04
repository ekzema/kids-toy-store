source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1', '>= 7.1.3.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5.4', '< 0.6.0'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.4"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"
gem 'redis-client', '~> 0.12.1'
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem 'webpacker', '6.0.0.rc.6'

#API
gem 'active_model_serializers', '~> 0.10.14'

# Upload files
gem 'carrierwave', '~> 2.2', '>= 2.2.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.1', '>= 1.1.1'
gem 'jwt_sessions', '~> 3.0', '>= 3.0.1'

# Email
gem 'valid_email2', '~> 4.0', '>= 4.0.4'

# Url
gem 'friendly_id', '~> 5.5'

# For transcription
gem 'russian', '~> 0.6.0'

# Env
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem 'capistrano', '~> 3.18', require: false
gem 'capistrano-rails', '~> 1.6', '>= 1.6.3', require: false
gem 'capistrano-bundler', '~> 2.1', require: false
gem 'capistrano-rbenv', '~> 2.2', require: false
gem 'capistrano-nvm', '~> 0.0.7', require: false
gem 'capistrano-yarn', '~> 2.0', '>= 2.0.2', require: false

group :development, :test do
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'faker', '~> 3.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rubocop', '~> 1.41', '>= 1.41.1'
  gem 'rubocop-performance', '~> 1.15', '>= 1.15.2'
  gem 'rubocop-rails', '~> 2.17', '>= 2.17.4'
  gem 'rubocop-rspec', '~> 2.16'
  gem 'simplecov', '~> 0.22.0', require: false

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem "letter_opener"
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'shoulda-matchers', '~> 5.3'
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
end
