module Iugu
  class Invoice < APIResource
    include Iugu::APIFetch
    include Iugu::APICreate
    include Iugu::APISave
    include Iugu::APIDelete

    def customer
      return false unless @attributes["customer_id"]
      Customer.fetch @attributes["customer_id"]
    end

    def cancel
      copy Iugu::Factory.create_from_response(self.class.object_type, APIRequest.request("PUT", "#{self.class.url(self.id)}/cancel"))
      true
    rescue
      false
    end

    def refund
      copy Iugu::Factory.create_from_response(self.class.object_type, APIRequest.request("POST", "#{self.class.url(self.id)}/refund"))
      true
    rescue
      false
    end
  end
end
