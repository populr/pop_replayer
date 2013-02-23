# encoding: UTF-8

require 'optparse'
require 'date'
require 'json'

file = File.open("log.txt", "r")
contents = file.read
file.close

out = File.open("diffs.txt", "w")

pop_id = '5102f364dd02dc074c000004'

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
