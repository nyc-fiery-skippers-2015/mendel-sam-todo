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

  describe 'PUT#update' do
    let!(:task) {list.tasks.build(body: "test body")}
    it "updates with valid attributes" do
      task.save
      expect {
        put :update, :list_id => list.id, :id => task.id, :task => {:body => "yo"}
      }.to change { task.reload.body }.to("yo")
      expect(response).to be_redirect
    end

    it "doesn't update if attributes are invalid" do
      task.save
      expect {
        put :update, :list_id => list.id, :id => task.id, :task => {:body => nil}
      }.to_not change { task.reload.body }
      expect(response).not_to be_redirect
    end
  end

  describe 'DELETE#destroy' do
    let!(:task) {list.tasks.build(body: "test body")}
    it "destroys the record" do
      task.save
      expect {
        delete :destroy, :list_id => list.id, :id => task.id
      }.to change { Task.count }.by(-1)
    end
  end
end
