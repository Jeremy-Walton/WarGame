require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
	t.pattern = 'tests/**/*_tests.rb'
end