require 'spec_helper'

describe Iugu::Account do
  before do
    # Iugu.api_key = '613adf5a1d18ceda35815abc837cf7f3'
    Iugu.api_key = '0A4CF8F3885C46D49B7A31C37A8B38D5'
  end
  fdescribe '.create' do
    it 'should create a sub account', :vcr do
      account = Iugu::Account.create(name: 'John Snow', commission_percent: 15)

      expect(account.is_new?).to be_falsy
      expect(account.id).to_not be_nil
    end
  end

  describe '.fetch' do
    it 'should return accounts', :vcr do
      account = Iugu::Account.fetch('ABC123', 'TTOKEEN')

      byebug
      expect(account.total).to eq(2)
    end
  end

  describe '.save' do
    it 'should save the subscription', :vcr do
      subscription = Iugu::Subscription.fetch(id: '1CBD18FA1E4B47C891EFD82EF4321BC4')
      subscription.plan_identifier = 'medium'

      subscription.save

      saved_subscription = Iugu::Subscription.fetch(id: '1CBD18FA1E4B47C891EFD82EF4321BC4')

      expect(saved_subscription.plan_identifier).to eq('medium')
    end
  end

  describe '.delete' do
    it 'should delete the subscription', :vcr do
      subscription = Iugu::Subscription.fetch(id: 'C09161223BE1467E9DC4F4DFCC5687DC')

      subscription.delete

      expect { Iugu::Subscription.fetch(id: subscription.id) }.to raise_error(Iugu::ObjectNotFound)
    end
  end
end
