module Iugu
  class Factory
    def self.create_from_response(object_type, response)
      if response['items']
        results = []
        response['items'].each do |v|
          results.push self.create_from_response(object_type, v)
        end
        Iugu::SearchResult.new results, response['totalItems']
      else
        Iugu.const_get(object_type.capitalize).new response
      end
    rescue
      nil
    end
  end
end
