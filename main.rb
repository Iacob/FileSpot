#!/usr/bin/env ruby

require 'sinatra'

set :port, 8080

set :public_folder, 'web'

get '/' do
  return 'Hello'
end

post '/upload' do
  tempfile = params['file1'][:tempfile]
  puts IO.read(tempfile)
  return 'uploaded'
end
