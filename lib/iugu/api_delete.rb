module Iugu
  module APIDelete
    def delete
      true if APIRequest.request "DELETE", self.class.url(self.attributes)
    end
  end
end
