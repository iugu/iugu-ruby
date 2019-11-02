module Iugu
  class Plan < APIResource
    include Iugu::APIFetch
    include Iugu::APICreate
    include Iugu::APISave
    include Iugu::APIDelete

    def fetch_by_identifier(identifier)
      Iugu::Factory.create_from_response(self, APIRequest.request(self, 'GET', "#{url}/identifier/#{identifier}"))
    end
  end
end
