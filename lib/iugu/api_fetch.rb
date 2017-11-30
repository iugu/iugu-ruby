module Iugu
  module APIFetch
    def refresh
      copy Iugu::Factory.create_from_response(self.class.object_type,
                                              APIRequest.request('GET',
                                                                 self.class.url(self.id)))
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end

    module ClassMethods
      def fetch(options = nil)
        Iugu::Factory.create_from_response(self.object_type,
                                           APIRequest.request('GET',
                                                              self.url(options)))
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
