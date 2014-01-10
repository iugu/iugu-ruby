module Iugu
  module APIFetch
    module ClassMethods
      def fetch(id)
        Iugu::Factory.create_from_response self.object_type, APIRequest.request("GET", self.url(id))
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
