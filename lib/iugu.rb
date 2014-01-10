require_relative "iugu/version"
require_relative "iugu/utils"
require_relative "iugu/api_request"
require_relative "iugu/object"
require_relative "iugu/api_resource"
require_relative "iugu/factory"
require_relative "iugu/search_result"
require_relative "iugu/api_fetch"
require_relative "iugu/api_create"
require_relative "iugu/api_save"
require_relative "iugu/api_delete"
require_relative "iugu/api_search"
require_relative "iugu/customer"

module Iugu
  class AuthenticationException < Exception
  end

  class RequestFailed < Exception
  end

  class ObjectNotFound < Exception
  end

  class RequestWithErrors < Exception
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
