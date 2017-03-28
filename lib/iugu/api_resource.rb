module Iugu
  class APIResource < Iugu::Object
    def self.url(options = nil)
      puts endpoint_url.inspect
      if options
        endpoint_url + self.relative_url(options)
      else
        endpoint_url
      end
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
      pluralized_models = ["customer", "payment_method", "invoice", "subscription", "plan"]
      if pluralized_models.include? self.object_type
        object_type = self.object_type + "s"
      else
        object_type = self.object_type
      end
      object_type
    end
  end
end
