module Iugu
  module APICreate
    module ClassMethods
      def create(attributes = {}, token = nil)
        Iugu::Factory.create_from_response(
          object_type,
          APIRequest.request('POST', url(attributes), attributes, token)
        )
      rescue Iugu::RequestWithErrors => ex
        obj = new
        obj.set_attributes attributes, true
        obj.errors = ex.errors
        obj
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
