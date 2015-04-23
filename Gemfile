source 'https://rubygems.org'

gem 'pry'
gem 'twitter'
gem 'figaro'
gem 'bourbon'
gem 'neat'
gem 'bitters'

# TODO
# hashPage versioning...
# gem 'paper_trail', '~> 4.0.0.beta'

gem 'rails', '4.1.6'
gem 'sqlite3', group: :development

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'spring',        group: :development

group :production do
  gem 'pg'
  gem 'rails_12factor'
end


group :test do
  gem 'vcr'
  # gem 'webmock'                 # do I need this?
  gem 'minitest-rails-capybara' # Installs gems: minitest, minitest-rails, minitest-capybara, capybara
  gem 'shoulda'                 # matchers and context as meta gem
  gem 'mocha'                   # stubs for unit tests
  gem 'capybara-webkit'         # question - is this necessary still?
  gem 'capybara_minitest_spec'  # question - is this necessary still?
end
