require 'spec_helper'

describe Iugu::PaymentToken do
  describe '.create' do
    it 'should create a payment token', :vcr do
      token = Iugu::PaymentToken.create(account_id: '',
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

      expect(token.is_new?).to be_falsy

      expect(token.id).to_not be_nil
      expect(token.method).to eq('credit_card')

      expect(token.extra_info['month']).to eq(2)
      expect(token.extra_info['year']).to eq(2020)
      expect(token.extra_info['brand']).to eq('VISA')

      expect(token.extra_info['bin']).to eq('411111')
      expect(token.extra_info['holder_name']).to eq('Walter White')
      expect(token.extra_info['display_number']).to eq('XXXX-XXXX-XXXX-1111')
    end
  end
end
