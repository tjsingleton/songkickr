module Songkickr
  class ResultSet
    attr_accessor :page, :per_page, :total_entries, :results, :result_type, :result_key_string, :status

    RESULTS_PAGE  = 'resultsPage'.freeze
    STATUS        = 'status'.freeze
    PAGE          = 'page'.freeze
    PER_PAGE      = 'per_page'.freeze
    TOTAL_ENTRIES = 'totalEntries'.freeze
    RESULTS       = 'results'.freeze

    def initialize(result_hash = {})
      results_page = result_hash[RESULTS_PAGE]

      if results_page
        @status        = results_page[STATUS]                if results_page.include? STATUS
        @page          = results_page[PAGE]                  if results_page.include? PAGE
        @per_page      = results_page[PER_PAGE]              if results_page.include? PER_PAGE
        @total_entries = results_page[TOTAL_ENTRIES]          if results_page.include? TOTAL_ENTRIES
        @results       = parse_results results_page[RESULTS] if results_page.include? RESULTS
      end
    end

    protected

      def parse_results(results = {})
        return [] unless results.include? result_key_string
        results[result_key_string].inject([]) do |result_items, result_item|
          result_items << Songkickr.const_get("#{result_type}").new(result_item)
        end
      end
  end
end
