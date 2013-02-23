# encoding: UTF-8

require 'optparse'
require 'date'
require 'json'

file = File.open("log.txt", "r")
contents = file.read.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
contents = contents.gsub(/#<ActionDispatch::Http::UploadedFile:[^>]*>>/, '""')
file.close

out = File.open("diffs.txt", "w")

pop_id = '50bd056898bd10f7ea000015'

all_params = contents.scan(/Parameters: (.*)\n/)
all_params.each do | result |
  diff = eval(result[0])
  if diff['revision_updated_at'] && diff['id'] == pop_id && diff['contents_diff']
    out.write diff['contents_diff']
    out.write "\n"
  end
end

out.close

# TO DO - Add your Modules, Classes, etc
