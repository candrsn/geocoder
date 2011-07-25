#!/usr/bin/ruby

require 'rubygems'
require 'geocoder/us/database'
require 'pp'
require 'fastercsv'

  dbg = false
  gdb = "/opt/geocoder_us/geocoder.db"
  db = Geocoder::US::Database.new(gdb, :debug=>dbg)
  ofs = 0 # the number of rows to skip, used for testing
  itr = 0 # a record counter 
  otpt = "/opt/data/ccr_geocode_p3.txt"
  inpt = "/opt/data/ccr/CCR.csv" 

  FasterCSV.open(otpt, "w") do |csv|

    csv << ["CAGE_CODE","LAT","LON","PREC","SCORE", "ADDR"]
    FasterCSV.foreach(inpt) do |row|
      # use row here...
      if itr < ofs
        itr = itr + 1
      else
#        pp(row)
        zip = String(row[12])
        if zip.length < 5 
          zip = zip.rjust(5,"0") 
        else
          if zip.length < 9
            zip = zip.rjust(9,"0")
          end
        end
        zip = zip.slice(0,5)
        $stderr.print "ZIP: #{row[12]}, #{zip}\n" if dbg
        zip4 = ("#{row[12]}0000")[6,4]

        line1 = String(row[8])
        line2 = String(row[9])
        addr = "#{line1} #{line2} #{row[10]}, #{row[11]} #{zip}"
#        $stderr.print "addr: #{addr}\n"
        result = db.geocode(addr)
#        pp(result)
        if result.count > 0
          $stderr.print "#{row[0]}, #{result[0][:lat]} N, #{-result[0][:lon]} W, score: #{result[0][:score]}, precision: #{result[0][:precision]}\n" if @dbg
          csv << [row[0], result[0][:lat], result[0][:lon],  result[0][:precision],  result[0][:score], addr]
        else
          csv << [row[0], "-1", "-1", "not found", 0, addr]
        end
      end
    end 
 
  end

