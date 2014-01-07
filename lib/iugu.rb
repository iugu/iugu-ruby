require "iugu/version"

module Iugu
  class AuthenticationException < Exception
  end

  @@api_key = nil
  @@api_version = 'v1'
  @@endpoint = 'https://api.iugu.com'

  def self.base_uri
    "#{@@endpoint}/#{@@api_version}/"
  end

  def self.api_key=(value)
   @@api_key = value 
  end

  def self.api_key
    @@api_key
  end
end
