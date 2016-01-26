module Iugu
  class Account < APIResource

    # POST /marketplace/create_account
    #
    # Creates a account
    #
    # @param [Hash] attributes the values to create an account
    # @option attributes [String] :name The name of an account
    # @option attributes [Integer] :commission_percent The commission_percent
    #   of an account


    def self.create(attributes)
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
    #
    # Verify a account
    #
    # @param [Hash] attributes the values to verify an account, divided into two
    #   hashes, [data] and [file]
    # @option attributes[data] [String] :price_range the price range is the max value
    #   of sale, possible values ['Até R$ 100,00', 'Entre R$ 100,00 e R$ 500,00',
    #  'Mais que R$ 500,00']
    # @option attributes[data] [Boolean] :physical_products the physical products
    #   defines if the account sells physical product, possible values
    #   [true, false]
    # @option attributes[data] [String] :business_type the business type of an account
    # @option attributes[data] [String] :person_type the person type of an account,
    #   possible values ['Pessoa Física', 'Pessoa Jurídica']
    # @option attributes[data] [Boolean] :automatic_transfer the automatic transfer
    #   defines automatic withdraws, possible values [true, false]
    #   (recommended that be true)
    # @option attributes[data] [String] :cnpj the cnpj of an account if person_type is
    #   Pessoa Jurídica
    # @option attributes[data] [String] :company_name the company name if person_type
    #   is Pessoa Jurídica
    # @option attributes[data] [String] :cpf the cpf of an account if person_type is
    #   Pessoa Física
    # @option attributes[data] [String] :name the name of an account if person_type
    #   is Pessoa Física
    # @option attributes[data] [String] :address the address of an account
    # @option attributes[data] [String] :cep the cep of an account
    # @option attributes[data] [String] :city the city of an account
    # @option attributes[data] [String] :state the state of an account
    # @option attributes[data] [String] :telephone the telephone of an account
    # @option attributes[data] [String] :resp_name the responsible name if
    #   person_type is Pessoa Jurídica
    # @option attributes[data] [String] :resp_cpf the responsible cpf if
    #   person_type is Pessoa Jurídica
    # @option attributes[data] [String] :bank the bank that will be used to withdraw,
    #   possible values ['Itaú','Bradesco','Caixa Econômica','Banco do Brasil',
    #   'Santander']
    # @option attributes[data] [String] :bank_ag the bank ag is the number of the
    #   bank agency of an account
    # @option attributes[data] [String] :account_type the account_type is the type of
    #  an bank account, possible values ['Corrente', 'Poupança']
    # @option attributes[data] [String] :bank_cc the bank cc is the number of the
    #   bank account of an account
    # @option attributes[file] [File] :id the id is the file with RG
    # @option attributes[file] [File] :cpf the cpf is the file with CPF
    # @option attributes[file] [File] :activity the activity is a document proving the
    #   activity of the company
    # @param [String] account_id the account_id of an account
    # @param [String] user_token the user_token of an account


    def self.verify(attributes, account_id, user_token)
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
    #
    # Fetch a account
    #
    # @param [String] account_id the account_id of an account
    # @param [String] user_token the user_token of an account

    def self.fetch(account_id, user_token)
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

    # Configures a account
    # POST /accounts/configuration

    def self.configuration(attributes, api_token)
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

    # POST /accounts/transfers
    #
    # Transfers an amount to another account
    #
    # @param [Hash] attributes the values to make a transfer of an account
    # @param [String] account_id the account_id of account with will receive
    # @param [String] amount_cents the value in cents that will be transferred

    def self.transfer(attributes)
      Iugu::Factory.create_from_response(
        object_type,
        APIRequest.request(
          "POST",
          "#{Iugu.base_uri}transfers",
          attributes
        )
      )
    end



    # POST /accounts/:account_id/request_withdraw
    #
    # Withdraw a value of an account
    #
    # @param [Hash] attributes the values to make a withdrawal of an account
    # @option attributes [Float] :amount the amount defines the value of
    #   withdrawal
    # @param [String] account_id the account_id of an account
    # @param [String] user_token the user_token of an account

    def self.withdraw(attributes, account_id, user_token)
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

    # POST /bank_verification
    #
    # Update a bank account
    #
    # @param [Hash] attributes the values to update an bank account
    # @option attributes [Integer] :agency The number of agency
    # @option attributes [Integer] :account The number of account
    # @option attributes [String] :account_type The type of account
    # @option attributes [Integer] :bank The number of the bank account
    # @option attributes [file] :document Documento for comprove the data of bank account


    def self.bank(attributes, user_token)
      Iugu::Factory.create_from_response(
        object_type,
        APIRequest.request(
          "POST",
          "#{Iugu.base_uri}bank_verification",
          attributes,
          user_token
        )
      )
    end



  end
end
