class TasksController < ApplicationController

    before_action :find_task, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = Task.all
    end

    def show
    end

    def new
        @task = Task.new # needed to instantiate the form_for
    end

    def create
        @task = Task.new(task_params)
        @task.save
        # Will raise ActiveModel::ForbiddenAttributesError
        # no need for app/views/restaurants/create.html.erb
        redirect_to tasks_path
    end

    def edit
    end

    def update
        # @task.completed = !params[:checkbox].nil?
        @task.update(task_params)
        # Will raise ActiveModel::ForbiddenAttributesError
 
        redirect_to task_path
    end

    def destroy
        @task.destroy
    # no need for app/views/restaurants/destroy.html.erb
        redirect_to tasks_path
    end

    private

    def task_params
        params.require(:task).permit(:title, :details, :completed)
    end

    def find_task
        @task = Task.find(params[:id])
    end
  
end
