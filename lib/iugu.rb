require_relative "iugu/version"
require_relative "iugu/utils"
require_relative "iugu/api_request"
require_relative "iugu/object"
require_relative "iugu/api_resource"
require_relative "iugu/api_child_resource"
require_relative "iugu/factory"
require_relative "iugu/search_result"
require_relative "iugu/api_fetch"
require_relative "iugu/api_create"
require_relative "iugu/api_save"
require_relative "iugu/api_delete"
require_relative "iugu/api_search"
require_relative "iugu/customer"
require_relative "iugu/payment_method"
require_relative "iugu/payment_token"
require_relative "iugu/invoice"
require_relative "iugu/subscription"
require_relative "iugu/charge"
require_relative "iugu/plan"
require_relative "iugu/account"

module Iugu
  class AuthenticationException < StandardError
  end

  class RequestFailed < StandardError
  end

  class ObjectNotFound < StandardError
  end

  class RequestWithErrors < StandardError
    attr_accessor :errors

    def initialize(errors)
      @errors = errors
    end
  end

  class << self
    attr_accessor :api_key
  end

  @api_version = 'v1'
  @endpoint = 'https://api.iugu.com'

  def self.base_uri
    "#{@endpoint}/#{@api_version}/"
  end
end
