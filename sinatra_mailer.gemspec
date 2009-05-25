Gem::Specification.new do |s|
  s.name     = "sinatra_mailer"
  s.version  = "0.9.2"
  s.date     = "2009-05-22"
  s.summary  = "Send emails from Sinatra like Merb::Mailer"
  s.email    = "kusorbox@gmail.com"
  s.homepage = "http://github.com/kusor/sinatra-mailer/tree/master"
  s.description = "Sinatra::Mailer extension extracted from Merb::Mailer by Nicolás Sanguinetti."
  s.authors  = ["Nicolás Sanguinetti", "Pedro P. Candel"]

  s.has_rdoc = false
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = ["README.markdown"]

  s.files = %w[
    LICENSE
    README.markdown
    sinatra_mailer.gemspec
    Rakefile
    lib/sinatra/mailer.rb
  ]
  s.test_files = %w[
    test/test_classic_application.rb
    test/test_modular_application.rb
  ]

  s.add_dependency 'sinatra', '>= 0.9.2'
  s.add_dependency 'mailfactory', '>= 1.4.0'
  s.add_development_dependency 'rack-test', '>= 0.3.0'
end
