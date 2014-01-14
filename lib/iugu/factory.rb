module Iugu
  class Factory
    def self.create_from_response(object_type, response)
      if response.is_a?(Array)
        results = []
        response.each do |i|
          results.push Iugu.const_get(Iugu::Utils.camelize(object_type)).new i
        end
        results
      elsif response['items']
        results = []
        response['items'].each do |v|
          results.push self.create_from_response(object_type, v)
        end
        Iugu::SearchResult.new results, response['totalItems']
      else
        Iugu.const_get(Iugu::Utils.camelize(object_type)).new response
      end
    end
  end
end
