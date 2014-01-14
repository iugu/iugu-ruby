module Iugu
  class APIResource < Iugu::Object
    def self.url(options = nil)
      endpoint_url + self.relative_url(options)
    end

    def is_new?
      @attributes['id'].nil?
    end

    protected

    def self.object_type
      Iugu::Utils.underscore self.name.to_s.split('::')[-1]
    end

    def self.endpoint_url
      Iugu.base_uri + object_base_uri 
    end
    
    def self.relative_url(options = "")
      if options.is_a?(Hash)
        id = options[:id] || options["id"]
      elsif options.is_a?(Iugu::APIResource)
        id = options.id
      else
        id = options
      end
      id ? "/#{id}" : ""
    end

    def self.object_base_uri
      case self.object_type
      when "customer"
        object_type = self.object_type + "s"
      when "payment_method"
        object_type = self.object_type + "s"
      end
      object_type
    end
  end
end
