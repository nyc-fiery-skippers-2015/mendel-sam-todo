class TasksController < ApplicationController

  def show
    @task = Task.find_by(id: params[:id])
  end

end
