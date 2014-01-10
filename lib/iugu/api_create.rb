module Iugu
  module APICreate
    module ClassMethods
      def create(attributes = {})
        Iugu::Factory.create_from_response self.object_type, APIRequest.request("POST", self.url, attributes)
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
