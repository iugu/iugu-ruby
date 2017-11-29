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
  end
end
