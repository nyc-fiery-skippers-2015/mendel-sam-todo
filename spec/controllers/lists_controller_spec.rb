require 'rails_helper'

describe ListsController do
  describe 'GET#index' do
    it 'is successful' do
      get :index
      expect(response).to be_success
    end

    it 'assigns @lists to List.all' do
      get :index
      expect(assigns(:lists)).to eq List.all
    end

  end
end
