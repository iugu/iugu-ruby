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

    it 'should create a charge with credit card', :vcr do
      token = Iugu::PaymentToken.create(account_id: '842C5942D8E34372A8E554A1BC959086',
                                        method: 'credit_card',
                                        test: 'true',
                                        data: {
                                          number: '4111111111111111',
                                          verification_value: '123',
                                          first_name: 'Walter',
                                          last_name: 'White',
                                          month: '02',
                                          year: '2020'
                                        })


      charge = Iugu::Charge.create(token: token.id,
                                   payer: { name: 'Awesome Customer',
                                            cpf_cnpj: '15111975000164',
                                            address: { zip_code: '29190560', number: '100'} },
                                   items: [[{ quantity: 1,
                                              price_cents: 5000,
                                              description: 'item 1' }]],
                                   currency: 'BRL',
                                   email: 'example@example.example')

      expect(charge.success).to be_truthy
      expect(charge.message).to eq('Autorizado')
      expect(charge.url).to_not be_nil
      expect(charge.pdf).to_not be_nil
      expect(charge.invoice_id).to_not be_nil
      expect(charge.identification).to be_nil
      expect(charge.LR).to eq('00')
    end

  end
end
