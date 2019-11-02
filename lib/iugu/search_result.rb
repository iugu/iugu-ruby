module Iugu
  class SearchResult
    def initialize(results, total_results)
      @results = results
      @total = total_results
    end

    def total
      @total
    end

    def results
      @results
    end

    alias_method :count, :total
  end
end
