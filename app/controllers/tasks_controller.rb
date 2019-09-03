class TasksController < ApplicationController
  before_action :set_list
  
  def new
    @task = Task.new
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :new
    end
  end

  # def destroy
  #   @list.tasks.destroy
  #   redirect_to list_tasks_path(@list, @task)
  # end

  private

    def set_list
      @list = List.find(params[:list_id])
    end

    def task_params
      params.require(:task).permit(:body)
    end

end
