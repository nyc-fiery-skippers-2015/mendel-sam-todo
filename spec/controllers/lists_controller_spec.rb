require 'rails_helper'

describe ListsController do
  describe 'GET#index' do
    it 'is successful' do
      get :index
      expect(response).to be_success
    end
  end
end
