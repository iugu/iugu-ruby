require 'net/http'

module Iugu
  class APIRequest

    def self.request(method, url, data = {})
      raise Iugu::AuthenticationException, "Chave de API não configurada. Utilize Iugu.api_key = ... para configurar." unless Iugu.api_key

       
    end

    private

    def self.default_headers
      {
        'Authorization' => 'Basic ' + 'BASE64',
        'Accept' => 'application/json',
        'Accept-Charset' => 'utf-8',
        'User-Agent' => 'Iugu RubyLibrary',
        'Accept-Language' => 'pt-br;q=0.9,pt-BR'
      }
    end

  end
end
