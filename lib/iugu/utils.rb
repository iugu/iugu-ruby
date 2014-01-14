module Iugu
  class Utils
    def self.auth_from_env
      api_key = ENV['IUGU_API_KEY']
      Iugu.api_key = api_key if api_key
    end

    def self.intersect(array, another_hash)
      keys_intersection = array & another_hash.keys
      intersection = {}
      keys_intersection.each {|k| intersection[k] = another_hash[k]}
      intersection
    end

    def self.underscore(string)
      string.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end

    def self.camelize(string)
      string.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    end
  end
end
