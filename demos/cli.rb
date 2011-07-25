require 'rubygems'
require 'geocoder/us/database'
require 'pp'

gdb="/opt/geocoder_us/geocoder.db"

db = Geocoder::US::Database.new(gdb, :debug=>true)
result = db.geocode(ARGV[0])
#pp(result)
print "#{result[0][:lat]} N, #{-result[0][:lon]} W, score: #{result[0][:score]}, precision: #{result[0][:precision]}\n"
