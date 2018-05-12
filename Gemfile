source 'https://rubygems.org'

# Application foundations.
gem 'rails',            '4.1.0'
gem 'bcrypt',           '~> 3.1.7'
gem 'bower-rails',      '~> 0.7.1'
gem 'cancancan'
gem 'rails-i18n'
gem 'http_accept_language'
# Domain specific languages.
gem 'haml-rails'
gem 'sass-rails',       github: 'rails/sass-rails',
                        branch: '4-0-stable'
gem 'coffee-rails',     '~> 4.0.0'
# Active model serializers.
gem 'active_model_serializers'

# Client-side / frameworks.
gem 'jquery-rails'
gem 'foundation-rails', '~> 5.2.2'
gem 'foundation-icons-sass-rails'
gem 'compass-rails'
#gem 'i18n-js'
gem 'uglifier',         '>= 1.3.0'

gem 'pg', '~> 0.18.4'

group :development, :test do
  # Server.
  gem 'spring'
  # Deployment gems.
  gem 'rvm-capistrano'
end

group :production do
  gem 'libv8',        '~> 3.16.14.7'
  gem 'execjs'
  gem 'therubyracer', '~> 0.12.1', platforms: :ruby
end
