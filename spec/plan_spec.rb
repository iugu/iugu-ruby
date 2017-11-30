require 'spec_helper'

describe Iugu::Plan do
  describe '.create' do
    it 'should create a plan', :vcr do
      plan = Iugu::Plan.create(name: 'Medium',
                               identifier: 'medium',
                               interval: '1',
                               interval_type: 'months',
                               value_cents: '10000') # R$ 100,00

      expect(plan.is_new?).to be_falsy
      expect(plan.name).to eq('Medium')
      expect(plan.identifier).to eq('medium')
      expect(plan.interval).to eq(1)
      expect(plan.interval_type).to eq('months')
      expect(plan.prices.first['value_cents']).to eq(10000)
    end
  end

  describe '.fetch' do
    it 'should return plans', :vcr do
      plan = Iugu::Plan.fetch

      expect(plan.total).to eq(2)
    end

    it 'should return the customer', :vcr do
      plan = Iugu::Plan.fetch(id: 'FB088FDB05C14DFBB72AC087E00BB257')

      expect(plan.name).to eq('Medium')
      expect(plan.identifier).to eq('medium')
      expect(plan.interval).to eq(1)
      expect(plan.interval_type).to eq('months')
      expect(plan.prices.first['value_cents']).to eq(10000)
    end
  end

  describe '.save' do
    it 'should save the plan', :vcr do
      plan = Iugu::Plan.fetch(id: 'FB088FDB05C14DFBB72AC087E00BB257')

      plan.name = 'Super Medium'
      plan.value_cents = '12000'

      plan.save

      saved_plan = Iugu::Plan.fetch(id: plan.id)

      expect(saved_plan.name).to eq('Super Medium')
      expect(saved_plan.prices.first['value_cents']).to eq(12000)
    end
  end

  describe '.delete' do
    it 'should save the customer', :vcr do
      plan = Iugu::Plan.fetch(id: 'FB088FDB05C14DFBB72AC087E00BB257')

      plan.delete

      expect { Iugu::Plan.fetch(id: plan.id) }.to raise_error(Iugu::ObjectNotFound)
    end
  end
end
