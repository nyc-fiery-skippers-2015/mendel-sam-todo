require 'rails_helper'

describe TasksController do
  let(:list) {List.create(title: "test")}
  let(:task) {list.tasks.build(body: "test body")}
  describe 'GET#show' do
    it 'is successful' do
      task.save
      get :show, list_id: list.id, id: task.id
      expect(response).to be_success
    end

    it 'assigns @task to Task found by id' do
      task.save
      get :show, list_id: list.id, id: task.id
      expect(assigns(:task)).to eq task
    end
  end

  describe 'GET#new' do
    it 'is successful' do
      get :new, list_id: list.id
      expect(response).to be_success
    end

    it 'assigns @task to a task' do
      get :new, list_id: list.id
      expect(assigns(:task)).to be_a_new Task
    end

  end

end
