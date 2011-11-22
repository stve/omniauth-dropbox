require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-dropbox'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/dropbox'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :dropbox, ENV['APP_ID'], ENV['APP_SECRET']
end

run App.new