require 'sinatra'
require_relative 'email_sender'
require 'pry'

post '/tracking' do
 city = params['city']
end

get '/' do
	erb	:index
end