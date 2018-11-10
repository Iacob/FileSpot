#!/usr/bin/env ruby

require 'fileutils'
require 'digest'
require 'sinatra'

set :port, 8080

set :public_folder, 'web'

FILESPOT_FILE_PATH = "web/files"
FILESPOT_FILE_URL_PATH = "web/files"

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
  #
  file_path = FILESPOT_FILE_PATH + File::SEPARATOR + file_id
  file_path_full = Dir::pwd + File::SEPARATOR + file_path
  final_file_location = file_path_full + File::SEPARATOR + tempfilename
  #
  FileUtils.mkdir(file_path_full)
  FileUtils.cp(tempfile, final_file_location)
  #
  file_url_path = "/" + FILESPOT_FILE_URL_PATH + "/" + file_id + "/" +tempfilename
  #
  #puts IO.read(tempfile)
  #return 'uploaded'
  return file_url_path
end
