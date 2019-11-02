
module Iugu
  class Client
    def initialize(api_key:)
      @api_key = api_key
    end

    def charge
      Iugu::Charge.new(options)
    end

    def customer
      Iugu::Customer.new(options)
    end

    def invoice
      Iugu::Invoice.new(options)
    end

    def payment_method
      Iugu::PaymentMethod.new(options)
    end

    def payment_token
      Iugu::PaymentToken.new(options)
    end

    def subscription
      Iugu::Subscription.new(options)
    end

    def plan
      Iugu::Plan.new(options)
    end

    private

    def options
      { options: { api_key: @api_key } }
    end
  end
end
