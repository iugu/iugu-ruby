module Iugu
  class APIResource < Iugu::Object

    def self.url(object = nil)
      url = ""
      if object.is_a? String
        url = "/#{object}"
      elsif object.is_a?(Iugu::Object) && object.id
        url = "/#{object.id}"
      end
      Iugu.base_uri + object_base_uri + url
    end

    def is_new?
      @attributes['id'].nil?
    end

    private

    def self.object_type
      self.name.to_s.split('::')[-1].downcase
    end

    def self.object_base_uri
      case self.object_type
      when "customer"
        object_type = self.object_type + "s"
      end
      object_type
    end
  end
end
