module Iugu
  module APIFetch
    def refresh
      copy Iugu::Factory.create_from_response(self, APIRequest.request(self, 'GET', self.class.url(self.id)))
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end

    def fetch(options = {})
      Iugu::Factory.create_from_response(self, APIRequest.request(self, 'GET', self.class.url(options)))
    end
  end
end
