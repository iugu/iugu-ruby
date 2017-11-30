module Iugu
  module APISave
    def save
      method = is_new? ? 'POST' : 'PUT'
      copy Iugu::Factory.create_from_response(self.class.object_type,
                                              APIRequest.request(method,
                                                                 self.class.url(self.attributes),
                                                                 modified_attributes))
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end
  end
end
