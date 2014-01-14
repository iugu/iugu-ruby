module Iugu
  module APICreate
    module ClassMethods
      def search(options = {})
        Iugu::Factory.create_from_response self.object_type, APIRequest.request("GET", self.url(options), options)
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
