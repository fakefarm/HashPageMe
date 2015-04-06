# Adding test/services directory to rake test.
# http://blog.bigbinary.com/2014/04/26/adding-directory-to-rake-test.html

namespace :test do
  desc "Test tests/services/* code"
  Rails::TestTask.new(services: 'test:prepare') do |t|
    t.pattern = 'test/services/**/*_test.rb'
  end
end

Rake::Task['test:run'].enhance ["test:services"]


## NOTES
# namespace :hp do
#   desc 'this is a test'
#   task :my_task do
#     puts 'got here!'
#   end
# end
