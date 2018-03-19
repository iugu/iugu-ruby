require 'spec_helper'

describe Iugu::Account do
  describe '.create' do
    it 'should create a sub account', :vcr do
      account = Iugu::Account.create(name: 'John Snow', commission_percent: 15)

      expect(account.is_new?).to be_truthy
      expect(account.account_id).to_not be_nil
      expect(account.user_token).to_not be_nil
      expect(account.live_api_token).to_not be_nil
      expect(account.test_api_token).to_not be_nil
    end
  end

  describe '.fetch' do
    it 'should return account', :vcr do
      account = Iugu::Account.fetch('81EB28B1B2084E59AA34660789350CF7', '5635ede98f377d4be33f6c460c2868f7')

      expect(account.id).to eq('81EB28B1B2084E59AA34660789350CF7')
      expect(account.name).to eq('John Snow')
    end
  end

  describe '.verify' do
    it 'should request verification', :vcr do
      account = Iugu::Account.verify(
        {
          'data' => {
            'physical_products' => 'false',
            'price_range' => 'Mais que R$ 500,00',
            'business_type' => 'Adestramento de Animais de Estimação',
            'person_type' => 'Pessoa Física',
            'automatic_transfer' => 'false',
            'cpf' => '33502306877',
            'name' => 'Nelson Minor Haraguchi Junior',
            'address' => 'Rua Professor Rubião Meira, 101',
            'cep' => '05409-020',
            'city' => 'São Paulo',
            'state' => 'São Paulo',
            'telephone' => '11 35718138',
            'bank' => 'Itaú',
            'bank_ag' => '3129',
            'account_type' => 'Corrente',
            'bank_cc' => '23220-7'
          }
        }, '81EB28B1B2084E59AA34660789350CF7', '5635ede98f377d4be33f6c460c2868f7'
      )

      expect(account.id).to eq('946717C2CDD74DFDBCE28BB47A8FECA7')
      expect(account.created_at).to eq('2018-03-19T14:05:39-03:00')
    end
  end

  describe '.configuration' do
    it 'should change the sub account configuration', :vcr do
      account = Iugu::Account.configuration({ commission_percent: 10 }, '5635ede98f377d4be33f6c460c2868f7')
      expect(account.configuration['commission_percent']).to eq(10)
    end
  end

  describe '.transfer' do
    pending "Can't test, it's only in production need balance"
    # it 'should tranfer amount from the account of the api_token to the account with receiver_id', :vcr do
    #   account = Iugu::Account.transfer({ receiver_id: '0A4CF8F3885C46D49B7A31C37A8B38D5', amount_cents: 10_000 }, '5635ede98f377d4be33f6c460c2868f7')
    #   expect(account.receiver['id']).to eq('0A4CF8F3885C46D49B7A31C37A8B38D5')
    #   expect(account.amount_cents).to eq('10000')
    # end
  end

  describe '.withdraw' do
    pending "Can't test, it is only in production need balance"
  end

  describe '.bank' do
    it 'should change bank', :vcr do
      account = Iugu::Account.bank(
        {
          bank: '237',
          account_type: 'cc',
          account: '0296517-8',
          agency: '0095-7',
          automatic_validation: 'true'
        }, '5635ede98f377d4be33f6c460c2868f7'
      )
      expect(account.success).to eq(true)
    end
  end

  describe '.banks' do
    it 'should list banks', :vcr do
      account = Iugu::Account.banks('5635ede98f377d4be33f6c460c2868f7')
      expect(account.total).to eq(1)
    end
  end
end
