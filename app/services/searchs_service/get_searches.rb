module SearchsService
  class GetSearches < ApplicationService
    attr_reader :filter

    def initialize(limit,offset,filter)
      @limit = limit
      @offset = offset
      @filter = filter
    end

    def call
      if @filter.blank?
        searches = Search.all.order(created_at: :desc).limit(@limit).offset(@offset)
      else 
        searches = Search.where(filter: @filter).limit(@limit).offset(@offset)
      end
      searches
    end
  end
end
