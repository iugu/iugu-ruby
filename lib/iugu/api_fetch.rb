module Iugu
  module APIFetch
    module ClassMethods
      def fetch(options = nil)
        Iugu::Factory.create_from_response self.object_type, APIRequest.request("GET", self.url(options))
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
