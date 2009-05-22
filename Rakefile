require 'rake/gempackagetask'

$spec = eval(File.read('sinatra-mailer.gemspec'))

Rake::GemPackageTask.new($spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

require 'rake/testtask'

Rake::TestTask.new('test') do |t|
  t.libs = [File.expand_path('lib')]
  t.pattern = 'test/test_*.rb'
  t.warning = true
end

Rake::Task['test'].comment = 'Run tests for sinatra_mailer'
