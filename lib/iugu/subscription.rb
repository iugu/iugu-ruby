module Iugu
  class Subscription < APIResource
    include Iugu::APIFetch
    include Iugu::APICreate
    include Iugu::APISave
    include Iugu::APIDelete

    def suspend
      copy Iugu::Factory.create_from_response(self.class.object_type, APIRequest.request("POST", "#{self.class.url(self.id)}/suspend"))
      true
    rescue
      false
    end

    def activate
      copy Iugu::Factory.create_from_response(self.class.object_type, APIRequest.request("POST", "#{self.class.url(self.id)}/activate"))
      true
    rescue
      false
    end

    def change_plan(plan_identifier)
      copy Iugu::Factory.create_from_response(self.class.object_type, APIRequest.request("POST", "#{self.class.url(self.id)}/change_plan/#{plan_identifier}"))
      true
    rescue
      false
    end
  end
end
