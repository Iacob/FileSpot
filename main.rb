#!/usr/bin/env ruby

require 'fileutils'
require 'digest'
require 'sinatra'

set :port, 8080

set :public_folder, 'web'

FILESPOT_FILE_PATH = "web/files"

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
  file_id = Digest::MD5.hexdigest Time.now.to_f.to_s
  FileUtils.mkdir(Dir::pwd + "/#{FILESPOT_FILE_PATH}/" + file_id)
  FileUtils.cp(tempfile, Dir::pwd + "/#{FILESPOT_FILE_PATH}/" + file_id + "/" + tempfilename)
  #puts IO.read(tempfile)
  #return 'uploaded'
  return "/#{FILESPOT_FILE_PATH}/" + file_id + "/" + tempfilename
end
