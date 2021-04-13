module SearchsService
  class GetSearch < ApplicationService
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def call
      searches = Search.find_by id: @id
      searches
    end
  end
end
