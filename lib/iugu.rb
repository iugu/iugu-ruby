require "./iugu/version"

module Iugu
  class AuthenticationException < Exception
  end

  class RequestFailed < Exception
  end

  class ObjectNotFound < Exception
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

###
require "./iugu/utils"
require "./iugu/api_request"
require "./iugu/object"
require "./iugu/factory"
require "./iugu/api_resource"
require "./iugu/customer"

Iugu.api_key = "fb35bcd2691e057c86d09f9c3a3a050a"
###
