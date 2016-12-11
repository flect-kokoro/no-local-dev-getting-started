# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Account < ActiveRecord::Base
  self.table_name = 'salesforce.account'
end

get "/accounts" do
  @contacts = Account.all
  erb :index
end

class Device < ActiveRecord::Base
  self.table_name = 'salesforce.cariot__device__c'
end

get "/devices" do
  @devices = Device.all
  erb :index
end


get "/" do
  erb :home
end



#get "/contacts" do
#  @contacts = Contact.all
#  erb :index
#end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
