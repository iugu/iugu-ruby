module Iugu
  module APIFetch
    def refresh(token = nil)
      copy Iugu::Factory.create_from_response(
        self.class.object_type, APIRequest.request('GET', self.class.url(self.id), token)
      )
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end

    module ClassMethods
      def fetch(options = nil, token = nil)
        Iugu::Factory.create_from_response(
          self.object_type, APIRequest.request('GET', self.url(options), token)
        )
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
