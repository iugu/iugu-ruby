module Iugu
  class SearchResult
    def initialize(results, total_results)
      @results = results
      @total_results = total_results 
    end

    def total
      @total_results
    end

    def results
      @results
    end
  end
end
