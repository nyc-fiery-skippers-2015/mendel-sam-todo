require 'rails_helper'

describe TasksController do
  let(:list) {List.create(title: "test")}
  describe 'GET#show' do
    let(:task) {list.tasks.build(body: "test body")}
    it 'is successful' do
      task.save
      get :show, list_id: list.id, id: task.id
      expect(response).to be_success
    end

    it 'assigns @tasks to Task found by id' do
      task.save
      get :show, list_id: list.id, id: task.id
      expect(assigns(:task)).to eq task
    end
  end
end
