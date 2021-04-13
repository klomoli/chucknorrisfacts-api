module SearchsService
  class CreateSearch < ApplicationService
    attr_reader :term, :response, :filter

    def initialize(term, response, filter)
      @term = term
      @response = response
      @filter = filter
    end

    def call
      Search.create(term: @term, response: @response, filter: @filter)
    end
  end
end

