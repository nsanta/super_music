source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'puma', '~> 3.7'

gem "trailblazer"
gem "trailblazer-rails"
gem "trailblazer-cells"
gem 'roar', require: ['roar', 'roar/json/hal']
gem 'multi_json'
gem 'bcrypt', '~> 3.1.7'
gem 'kaminari'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "letter_opener" #Open emails on your browser

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
end

group :test do
  gem 'rspec-rails', require: false #required in both dev and test groups
  gem 'brakeman', require: false #Security scanner which checks application for security vulnerabilities. see: https://github.com/presidentbeef/brakeman
  gem 'faker' #makes it easy to provide fake data for testing, see: https://github.com/stympy/faker
  gem 'factory_girl_rails' #a fixtures replacement with a straightforward definition syntax, support for multiple build strategies. see https://github.com/thoughtbot/factory_girl_rails
  gem 'shoulda-matchers', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
