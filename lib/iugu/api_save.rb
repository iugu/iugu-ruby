module Iugu
  module APISave
    def save
      copy Iugu::Factory.create_from_response(self.class.object_type, APIRequest.request(is_new? ? "POST" : "PUT", self.class.url(self), modified_attributes))
      true
    end
  end
end
