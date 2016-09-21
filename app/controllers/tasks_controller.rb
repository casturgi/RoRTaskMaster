class TasksController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_action :find_task, only: [:show, :edit, :update, :destroy]

	def index
		@tasks = Task.all.order("created_at ASC")
		# if user_signed_in?
		# 	@tasks = Task.where(:user_id => current_user.id).order("created_at ASC")
		# end
	end

	def show
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		@task.user_id = current_user.id
		if @task.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def destroy
		@task.destroy
		redirect_to root_path
	end

	private 

	def task_params
		params.require(:task).permit(:name, :description, :resources, :user_id)
	end

	def find_task
		@task = Task.find(params[:id])
	end

end
