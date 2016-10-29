require 'sinatra'
require 'sinatra/activerecord'
require 'pry'

class TrackingInfo < ActiveRecord::Base
end

post '/tracking' do
  TrackingInfo.create(domain: params['domain'],
  										devicetype: params['device-type'],
  										region: params['region'],
  										city: params['city'],
  										country: params['country'],
  										clientname: params['client-name'],
  										clientos: params['client-os'],
  										url: params['url'],
  										ip: params['ip'],
  										recipient: params['recipient'],
  										timestamp: params['timestamp'],
  										event: params['event'])
end

get '/' do
	@tracking_infos = TrackingInfo.all
	erb	:index
end