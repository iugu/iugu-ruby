module Iugu
  class Utils
    def self.normalize_params(params, key=nil)
      params = self.flatten_keys params if params.is_a?(Hash)
      result = {}
      params.each do |k,v|
        case v
        when Hash
          result[k.to_s] = self.normalize_params(v)
        when Array
          v.each_with_index do |val,i|
            result["#{k.to_s}[#{i}]"] = val.to_s
          end
        else
          result[k.to_s] = v.to_s
        end
      end
      result
    end

    def self.flatten_keys(oldhash, newhash={}, keys=nil)
      oldhash.each do |k, v|
        k = k.to_s
        keys2 = keys ? keys+"[#{k}]" : k
        if v.is_a?(Hash)
          self.flatten_keys(v, newhash, keys2)
        else
          newhash[keys2] = v
        end
      end
      newhash
    end
  end
end
