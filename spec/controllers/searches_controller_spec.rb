require 'rails_helper'

describe SearchesController do
  before :all do
    
  end

  describe 'GET index' do
    context 'when all is ok' do  
      it 'return 200 Http status code' do
        get :index, params: {limit: 200, offset: 0}

        expect(response).to have_http_status 200
      end
    end
  end

  describe 'GET fetch facts by random category' do
    context 'when all is ok' do  
      it 'return 200 Http status code' do
        get :fetch_facts, params: {random_category: 'animal'}

        expect(response).to have_http_status 200
      end

    end
  end

  describe 'GET fetch facts by search' do
    context 'when all is ok' do  
      it 'return 200 Http status code' do
        get :fetch_facts, params: {search: 'president'}
        expect(response).to have_http_status 200
      end
    end
  end

  describe 'GET fetch facts by random' do
    context 'when all is ok' do  
      it 'return 200 Http status code' do
        get :fetch_facts, params: {randomness: 1}

        expect(response).to have_http_status 200
      end
    end
  end
end