class Cosvon::Writer
   def dump(data)
      CSV.generate do |csv|
         csv << ["CoSVON:0.1"]
         data.each do |key, val|
            csv << [key,val]
         end
      end
   end
end
