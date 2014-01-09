#encoding: UTF-8

require 'net/http'
require "base64"
require "json"

module Iugu
  class APIRequest

    def self.request(method, url, data = {})
      raise Iugu::AuthenticationException, "Chave de API não configurada. Utilize Iugu.api_key = ... para configurar." if Iugu.api_key.nil?
      handle_response self.send_request method, URI(url), data
    end

    private

    def self.send_request(method, uri, data)
      req = build_request method, uri, data
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http| http.request(req) }
    end

    def self.build_request(method, uri, data)
      req = Net::HTTP.const_get(method.capitalize).new uri.request_uri
      default_headers.each { |k, v| req.add_field k, v }
      req.set_form_data data, '&'
      puts req.body
      req
    end

    def self.handle_response(response)
      response_json = JSON.parse(response.body)
      raise ObjectNotFound if response_json['errors'] == "Not Found"
      response_json
    rescue JSON::ParserError
      raise RequestFailed
    end

    def self.default_headers
      {
        'Authorization' => 'Basic ' + Base64.encode64(Iugu.api_key + ":"),
        'Accept' => 'application/json',
        'Accept-Charset' => 'utf-8',
        'User-Agent' => 'Iugu RubyLibrary',
        'Accept-Language' => 'pt-br;q=0.9,pt-BR',
        'Content-Type' => 'application/x-www-form-urlencoded; charset=utf-8'
      }
    end

  end
end
