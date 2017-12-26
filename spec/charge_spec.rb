require 'spec_helper'

describe Iugu::Charge do
  describe '.create' do
    it 'should create a charge', :vcr do
      charge = Iugu::Charge.create(method: 'bank_slip',
                                   payer: { name: 'Awesome Customer',
                                            cpf_cnpj: '15111975000164',
                                            address: { zip_code: '29190560', number: '100'} },
                                   items: [[{ quantity: 1,
                                              price_cents: 5000,
                                              description: 'item 1' }]],
                                   currency: 'BRL',
                                   email: 'example@example.example')

      expect(charge.url).to_not be_nil
      expect(charge.pdf).to_not be_nil
      expect(charge.invoice_id).to_not be_nil
      expect(charge.identification).to_not be_nil
    end
  end
end
