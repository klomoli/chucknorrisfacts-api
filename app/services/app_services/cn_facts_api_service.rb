module AppServices
  class CnFactsApiService < ApplicationService

    require 'httparty'

    def initialize(params)
      @endpoint = params[:endpoint] || 'random'
    end

    def call
      result = HTTParty.get("https://api.chucknorris.io/jokes/#{@endpoint}")
    rescue HTTParty::Error => e
      OpenStruct.new({success?: false, error: e})
    else
      OpenStruct.new({success?: true, data: result})
    end
  end
end
