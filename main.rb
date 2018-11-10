#!/usr/bin/env ruby

require 'fileutils'
require 'sinatra'

set :port, 8080

set :public_folder, 'web'

# Show current directory
puts Dir::pwd

get '/' do
  return 'Hello'
end

post '/upload' do
  content_type 'text/plain'
  #
  tempfilename = params['file1'][:filename]
  tempfile = params['file1'][:tempfile]
  #
  FileUtils.cp(tempfile, Dir::pwd + "/web/files/" + tempfilename)
  #puts IO.read(tempfile)
  return 'uploaded'
end
