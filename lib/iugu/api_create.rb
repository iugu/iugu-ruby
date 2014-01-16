module Iugu
  module APICreate
    module ClassMethods
      def create(attributes = {})
        Iugu::Factory.create_from_response self.object_type,  APIRequest.request("POST", self.url(attributes), attributes)
      rescue Iugu::RequestWithErrors => ex
        obj = self.new
        obj.set_attributes attributes, true
        obj.errors = ex.errors
        obj
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
