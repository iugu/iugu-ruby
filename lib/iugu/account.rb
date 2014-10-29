module Iugu
  class Account < APIResource

    # POST /marketplace/create_account

    def self.create attributes
      Iugu::Factory.create_from_response(
        object_type,
        APIRequest.request(
          "POST",
          "#{Iugu.base_uri}marketplace/create_account",
          attributes
        )
      )
    end

    # POST /accounts/:account_id/request_verification

    def self.verify attributes, account_id, user_token
      Iugu::Factory.create_from_response(
        object_type,
        APIRequest.request(
          "POST",
          "#{url(account_id)}/request_verification",
          attributes,
          user_token
        )
      )
    end

    # GET /accounts/:account_id

    def self.search account_id, user_token
      Iugu::Factory.create_from_response(
        object_type,
        APIRequest.request(
          "GET",
          "#{url(account_id)}",
          {},
          user_token
        )
      )
    end

    # POST /accounts/configuration

    def self.configuration attributes, api_token
      Iugu::Factory.create_from_response(
        object_type,
        APIRequest.request(
          "POST",
          "#{url}/configuration",
          attributes,
          api_token
        )
      )
    end

    # POST /accounts/:account_id/request_withdraw

    def self.withdraw attributes, account_id, user_token
      Iugu::Factory.create_from_response(
        object_type,
        APIRequest.request(
          "POST",
          "#{url(account_id)}/request_withdraw",
          attributes,
          user_token
        )
      )
    end
  end
end
