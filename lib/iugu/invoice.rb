module Iugu
  class Invoice < APIResource
    include Iugu::APIFetch
    include Iugu::APICreate
    include Iugu::APISave
    include Iugu::APIDelete

    def customer
      return false unless @attributes['customer_id']
      Customer.new(options: self.options).fetch(@attributes['customer_id'])
    end

    def cancel
      copy Iugu::Factory.create_from_response(self, APIRequest.request(self, 'PUT', "#{self.class.url(self.id)}/cancel"))
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end

    def refund
      copy Iugu::Factory.create_from_response(self, APIRequest.request(self, 'POST', "#{self.class.url(self.id)}/refund"))
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end

    def duplicate(attributes = {})
      copy Iugu::Factory.create_from_response(self, APIRequest.request(self, 'POST', "#{self.class.url(self.id)}/duplicate", attributes))
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end
  end
end
