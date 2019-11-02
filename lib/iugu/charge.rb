module Iugu
  class Charge < APIResource
    include Iugu::APICreate

    def success
      @attributes['success'] || false
    end

    def invoice
      return false unless @attributes['invoice_id']
      Invoice.new(options: self.options).fetch(@attributes['invoice_id'])
    end
  end
end
