module Iugu
  class APIChildResource
    @parent_keys = {}
    @fabricator = nil

    def initialize(parent_keys = {}, fabricator)
      @parent_keys = parent_keys
      @fabricator = fabricator
    end

    def create(attributes = {})
      @fabricator.send "create", merge_params(attributes), token
    end

    def search(options = {})
      @fabricator.send "search", merge_params(options)
    end

    def fetch(options = nil)
      @fabricator.send "fetch", merge_params({ id: options })
    end

    private

    def merge_params(attributes)
      @parent_keys.merge attributes
    end
  end
end
