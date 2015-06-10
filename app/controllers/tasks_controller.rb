class TasksController < ApplicationController

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

end
