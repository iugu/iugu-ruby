module Iugu
  class Marketplace < APIResource
  	include Iugu::APIFetch
    include Iugu::APICreate
    include Iugu::APISave
    include Iugu::APIDelete

	  def self.create_account options = {}
      payload = options[:payload] || options['payload']
      if not payload
      	raise StandardError, 'Missing payload hash'
      elsif payload and not payload[:name]
      	raise StandardError, 'Missing payload name attribute'
      elsif payload and not payload[:commission_percent]
      	raise StandardError, 'Missing payload commission percent attribute'
      end
      Iugu::Factory.create_from_response object_type, APIRequest.request('POST', "#{url}/#{__method__}", options)
  	end
  end
end