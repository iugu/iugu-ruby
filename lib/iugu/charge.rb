module Iugu
  class Charge < APIResource
    include Iugu::APICreate

    def invoice
      return false unless @attributes['invoice_id']
      Invoice.fetch @attributes['invoice_id']
    end
  end
end
