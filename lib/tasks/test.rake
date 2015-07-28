# Adding test/services directory to rake test.
# http://blog.bigbinary.com/2014/04/26/adding-directory-to-rake-test.html

namespace :test do
  desc "Test tests/services/* code"
  Rails::TestTask.new(services: 'test:prepare') do |t|
    t.pattern = 'test/services/**/*_test.rb'
  end

  desc "Test tests/features/* code"
  Rails::TestTask.new(features: 'test:prepare') do |t|
    t.pattern = 'test/features/**/*_test.rb'
  end
end

Rake::Task['test:run'].enhance ["test:services", "test:features"]
