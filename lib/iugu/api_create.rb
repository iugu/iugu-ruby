module Iugu
  module APICreate
    def create(attributes = {})
      Iugu::Factory.create_from_response(self, APIRequest.request(self, 'POST', self.class.url(attributes), attributes))
    rescue Iugu::RequestWithErrors => ex
      obj = self.class.new
      obj.set_attributes attributes, true
      obj.errors = ex.errors
      obj
    end
  end
end
