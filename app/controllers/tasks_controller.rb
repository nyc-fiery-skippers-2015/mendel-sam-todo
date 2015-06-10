class TasksController < ApplicationController

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @list = List.find_by(id: params[:list_id])
    @task = @list.tasks.build(task_params)
    if @task.save
      redirect_to list_task_path(@list, @task)
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
    @list = @task.list
  end

  def update
    @task = Task.find_by(id: params[:id])
    @list = @task.list
    @task.update(task_params)
    if @task.save
      redirect_to list_task_path(@list, @task)
    else
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:body)
  end

end
