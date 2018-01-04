require 'spec_helper'

describe Iugu::Subscription do
  describe '.create' do
    it 'should create a subscription', :vcr do
      subscription = Iugu::Subscription.create(plan_identifier: 'basic',
                                               customer_id: '524AB141252E44D3B2D006D8845DB261',
                                               credits_based: false,
                                               expires_at: Date.new(2018, 8, 8))

      expect(subscription.is_new?).to be_falsy
      expect(subscription.id).to_not be_nil
    end

    it 'should create a subscription and an invoice when it is about to expire', :vcr do
      subscription = Iugu::Subscription.create(plan_identifier: 'basic',
                                               customer_id: '8941A38AB8BF4BBAA595C0E03F379C9C',
                                               expires_at: Date.new(2018, 1, 4))

      expect(subscription.recent_invoices.size).to eq(1)
    end

    it 'should create a subscription but not an invoice when it will expire 5 five days from now', :vcr do
      subscription = Iugu::Subscription.create(plan_identifier: 'basic',
                                               payable_with: 'credit_card',
                                               customer_id: '8941A38AB8BF4BBAA595C0E03F379C9C',
                                               expires_at: Date.new(2018, 1, 10))

      expect(subscription.recent_invoices.size).to eq(0)
    end
  end

  describe '.fetch' do
    it 'should return subscriptions', :vcr do
      subscriptions = Iugu::Subscription.fetch

      expect(subscriptions.total).to eq(2)
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
