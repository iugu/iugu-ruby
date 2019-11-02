module Iugu
  module APICreate
    def search(options = {})
      Iugu::Factory.create_from_response(self, APIRequest.request(self, "GET", self.class.url(options), options))
    end
  end
end
