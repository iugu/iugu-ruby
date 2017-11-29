require 'spec_helper'

describe Iugu::Customer do
  describe '.create' do
    it 'should create a customer', :vcr do
      customer = Iugu::Customer.create(email: 'john.snow@greatwall.com', name: 'John Snow')

      expect(customer.is_new?).to be_falsy
    end
  end
end
