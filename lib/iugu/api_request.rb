#encoding: UTF-8

require 'rest_client'
require "base64"
require "json"

module Iugu
  class APIRequest

    def self.request(method, url, data = {}, authorization_token = nil)
      Iugu::Utils.auth_from_env if Iugu.api_key.nil?
      raise Iugu::AuthenticationException, "Chave de API não configurada. Utilize Iugu.api_key = ... para configurar." if Iugu.api_key.nil?
      handle_response self.send_request method, url, data, authorization_token
    end

    private

    def self.send_request(method, url, data, authorization_token)
      RestClient::Request.execute build_request(method, url, data, authorization_token)
    rescue RestClient::ResourceNotFound
      raise ObjectNotFound
    rescue RestClient::UnprocessableEntity => ex
      raise RequestWithErrors.new JSON.parse(ex.response)['errors']
    rescue RestClient::BadRequest => ex
      raise RequestWithErrors.new JSON.parse(ex.response)['errors']
    end

    def self.build_request(method, url, data, authorization_token)
      data = data.to_json unless data[:multipart]
      {
        verify_ssl: true,
        headers: default_headers(authorization_token),
        method: method,
        payload: data,
        url: url,
        timeout: 30
      }
    end

    def self.handle_response(response)
      response_json = JSON.parse(response.body)
      raise ObjectNotFound if response_json.is_a?(Hash) && response_json['errors'] == "Not Found"
      raise RequestWithErrors, response_json['errors'] if response_json.is_a?(Hash) && response_json['errors'] && response_json['errors'].length > 0
      response_json
    rescue JSON::ParserError
      raise RequestFailed
    end

    def self.default_headers(authorization_token)
      token = authorization_token || Iugu.api_key
      {
        authorization: 'Basic ' + Base64.encode64(token + ":"),
        accept: 'application/json',
        accept_charset: 'utf-8',
        user_agent: 'Iugu RubyLibrary',
        accept_language: 'pt-br;q=0.9,pt-BR',
        #content_type: 'application/x-www-form-urlencoded; charset=utf-8'
        content_type: 'application/json; charset=utf-8'
      }
    end

  end
end
