require 'csv'
class Cosvon::Reader
   def load(data)
      tmp = CSV.parse(data)
      result = {}
      tmp.shift
      tmp.each do |d|
         key = d[0]
         value = d[1]
         result[key] = value
      end
      result
   end
end
