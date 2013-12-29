enable  :sessions, :logging

set :session_secret, ENV['SESSION_SECRET'] || 'This is a secret bro!'

set :root, File.dirname(__FILE__)

get '/' do
  erb :index
end

get '/domains' do
  require 'csv'
  file = File.expand_path("../sites.csv", File.dirname(__FILE__))

  content_type 'text/plain'
  CSV.read(file).delete_if {|a| a[2] == 'project' }.map {|a| "http://#{a[0]}" }.join("\n")
end
