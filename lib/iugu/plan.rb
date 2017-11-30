module Iugu
  class Plan < APIResource
    include Iugu::APIFetch
    include Iugu::APICreate
    include Iugu::APISave
    include Iugu::APIDelete

    def self.fetch_by_identifier(identifier)
      Iugu::Factory.create_from_response(object_type,
                                         APIRequest.request('GET',
                                                            "#{url}/identifier/#{identifier}"))
    end
  end
end
