class Cosvon::Writer
   def dump(data)
      result = "CoSVON:0.1\n"
      data.each do |key, val|
         result << "#{key},#{val}\n"
      end
      result
   end
end
