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

  describe 'GET#show' do
    let(:list) {List.create(title: "test")}
    it 'is successful' do
      get :show, id: list.id
      expect(response).to be_success
    end

    it 'assigns @lists to the List found by id' do
      get :show, id: list.id
      expect(assigns(:list)).to eq list
    end
  end

  describe 'GET#new' do
    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'assigns @list to a new list' do
      get :new
      expect(assigns(:list)).to be_a_new List
    end

  end


end
