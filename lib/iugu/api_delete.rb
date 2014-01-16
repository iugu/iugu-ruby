module Iugu
  module APIDelete
    def delete
      APIRequest.request "DELETE", self.class.url(self.attributes)
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end
  end
end
