module Iugu
  class Plan < APIResource
    include Iugu::APIFetch
    include Iugu::APICreate
    include Iugu::APISave
    include Iugu::APIDelete

    def prices
      APIChildResource.new({ plan_id: self.id }, Iugu::PlanPrice)
    end

    def features
      APIChildResource.new({ plan_id: self.id }, Iugu::PlanFeature)
    end
  end
end
