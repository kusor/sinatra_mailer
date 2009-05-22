$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
gem 'sinatra', '>= 0.9.1'
require 'sinatra/base'

require 'sinatra/mailer'

class ModularAppSample < Sinatra::Base
  
  register Sinatra::Mailer
  
  configure do
    Sinatra::Mailer.config = {:sendmail_path => '/usr/sbin/sendmail'}
    Sinatra::Mailer.delivery_method = :sendmail
  end
  
  get '/' do
    'Modular sample application'
  end

  get '/defined' do
    sent = email(
      :to => 'foo@example.com',
      :from => 'bar@example.com',
      :subject => 'Test Mail',
      :body => 'Plain text mail'
    )
    'Email sent!'
  end  
end

require "test/unit"
require "rack/test"

begin
  require "redgreen"
rescue LoadError
end

class TestModularApplication < Test::Unit::TestCase
  
  include Rack::Test::Methods
  
  def app
    ModularAppSample.new
  end
  
  def test_home_ok
    get '/'
    assert_equal 200, last_response.status
    assert last_response.body.length > 0
  end
  
  def test_helper_method
    assert defined?(:email)
    get '/defined'
    assert_equal 200, last_response.status
  end
  
end
