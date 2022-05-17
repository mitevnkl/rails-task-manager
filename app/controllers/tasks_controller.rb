class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @tasks = Task.new
    end

    def show
        id = params[:id].to_i
        @task = Task.find(id)
    end

    def create
        @task = Task.new(task_params)
        @task.save!
        redirect_to task_path(@task)
    end

    def edit
        set_task
    end

    def update
        set_task.update(task_params)
        redirect_to task_path(@task)
    end

    def destroy
        set_task
        @task.destroy
        redirect_to tasks_path
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :details)
    end

end
