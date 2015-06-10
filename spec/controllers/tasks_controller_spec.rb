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

    it 'assigns @task to Task found by id' do
      task.save
      get :show, list_id: list.id, id: task.id
      expect(assigns(:task)).to eq task
    end
  end

  describe 'GET#new' do
    let(:task) {list.tasks.build(body: "test body")}
    it 'is successful' do
      get :new, list_id: list.id
      expect(response).to be_success
    end

    it 'assigns @task to a task' do
      get :new, list_id: list.id
      expect(assigns(:task)).to be_a_new Task
    end
  end

  describe 'POST#create' do
    it 'creates with valid attributes' do
      expect {
        post :create, list_id: list.id, task: {body: "test"}
      }.to change {Task.count}.by(1)
      expect(response).to be_redirect
    end

    it 'doesnt create if attributes are invalid' do
      expect{
        post :create, list_id: list.id, task: {bob: "bob"}
      }.not_to change {Task.count}
      expect(response).not_to be_redirect
    end
  end

  describe 'GET#edit' do
    let(:task) {list.tasks.build(body: "test body")}
    it 'is successful' do
      task.save
      get :edit, list_id: list.id, id: task.id
      expect(response).to be_success
    end

    it 'assigns @task to the Task found by id' do
      task.save
      get :edit, list_id: list.id, id: task.id
      expect(assigns(:task)).to eq task
    end
  end
end













