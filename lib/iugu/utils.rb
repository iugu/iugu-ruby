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
  end
end
