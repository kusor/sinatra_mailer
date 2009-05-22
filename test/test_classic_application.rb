$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
gem 'sinatra', '>= 0.9.1'
require 'sinatra'

require 'sinatra/mailer'

set :environment, :test

configure do
  Sinatra::Mailer.config = {:sendmail_path => '/usr/sbin/sendmail'}
  Sinatra::Mailer.delivery_method = :sendmail
end

get '/' do
  'Classic sample application'
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


require "test/unit"
require "rack/test"

begin
  require "redgreen"
rescue LoadError
end

class TestClassicApplication < Test::Unit::TestCase
  
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
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