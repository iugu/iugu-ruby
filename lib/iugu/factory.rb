module Iugu
  class Factory
    def self.create_from_response(object_type, response)
      Iugu.const_get(object_type.capitalize).new response
    rescue
      nil
    end
  end
end
