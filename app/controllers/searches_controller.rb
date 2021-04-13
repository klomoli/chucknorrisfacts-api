class SearchesController < ApplicationController
  include ApplicationHelper
  before_action :determine_endpoint
  def index 
    @searches = SearchsService::GetSearches.call(5,0,params[:filter])
    render json: @searches
  end

  def fetch_facts
    @result = AppServices::CnFactsApiService.call(endpoint: @endpoint)
    if @result && @result.success?
      SearchsService::CreateSearch.call(@term, @result.data, @filter)
    end
    render json: @result   
  end

  def send_by_email
    search = SearchsService::GetSearch.call(params[:id])
    unless search.blank?
      search_decorator = decorate(search)
      MailServices::SendResults.call(search_decorator,params[:email])
      render json: {data: I18n.t('email_send')}.to_json
    else
      render json: {error: 2000, data: I18n.t('search_not_found')}.to_json
    end
  end

  private
    
    def determine_endpoint
      %i[randomness search random_category].each do |fltr|
        send("query_by_#{fltr}") if params[fltr.to_s].present?
      end
    end
    
    def query_by_randomness
      @endpoint = "random"
      @term = "-"
      @filter = "random"
    end
    
    def query_by_search
      @endpoint = "search?query=#{params[:search]}"
      @term = params[:search]
      @filter = "search"
    end

    def query_by_random_category
      @endpoint = "random?category=#{params[:random_category]}"
      @term = params[:random_category]
      @filter = "random by category"
    end

end
