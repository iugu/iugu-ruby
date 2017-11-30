require 'spec_helper'

describe Iugu::Customer do
  describe '.create' do
    it 'should create a customer with just the email and name', :vcr do
      customer = Iugu::Customer.create(email: 'john.snow@greatwall.com',
                                       name: 'John Snow',
                                       notes: 'knows nothing')

      expect(customer.is_new?).to be_falsy
      expect(customer.email).to eq('john.snow@greatwall.com')
      expect(customer.name).to eq('John Snow')
      expect(customer.notes).to eq('knows nothing')
    end

    it 'should create a customer with CPF', :vcr do
      customer = Iugu::Customer.create(email: 'john.snow@greatwall.com',
                                       name: 'John Snow',
                                       cpf_cnpj: '648.144.103-01')

      expect(customer.is_new?).to be_falsy
      expect(customer.cpf_cnpj).to eq('648.144.103-01')
    end

    it 'should create a customer with CPNJ', :vcr do
      customer = Iugu::Customer.create(email: 'john.snow@greatwall.com',
                                       name: 'John Snow',
                                       cpf_cnpj: '57.202.023/6256-27')

      expect(customer.is_new?).to be_falsy
      expect(customer.cpf_cnpj).to eq('57.202.023/6256-27')
    end

    it 'should create a customer with full address', :vcr do
      customer = Iugu::Customer.create(email: 'john.snow@greatwall.com',
                                       name: 'John Snow',
                                       cpf_cnpj: '648.144.103-01',
                                       cc_emails: 'heisenberg@lospolloshermanos.com',
                                       zip_code: '29190560',
                                       number: '8',
                                       street: 'Rua dos Bobos',
                                       city: 'São Paulo',
                                       state: 'SP',
                                       district: 'Mooca',
                                       complement: '123C')

      expect(customer.is_new?).to be_falsy
      expect(customer.cpf_cnpj).to eq('648.144.103-01')
      expect(customer.cc_emails).to eq('heisenberg@lospolloshermanos.com')
      expect(customer.zip_code).to eq('29190560')
      expect(customer.number).to eq('8')
      expect(customer.street).to eq('Rua dos Bobos')
      expect(customer.district).to eq('Mooca')
      expect(customer.complement).to eq('123C')
    end

    it 'should raise error when the email is empty', :vcr do
      customer = Iugu::Customer.create
      expect(customer.errors['email']).to_not be_nil
    end
  end

  describe '.fetch' do
    it 'should return customers', :vcr do
      customers = Iugu::Customer.fetch

      expect(customers.total).to eq(15)
    end

    xit 'should return the customer', :vcr do
      customer = Iugu::Customer.fetch(id: '2D3309067D0047B7AD55F38EBA0BA406')

      expect(customer.email).to eq('john.snow@greatwall.com')
      expect(customer.name).to eq('John Snow')
    end
  end
end
