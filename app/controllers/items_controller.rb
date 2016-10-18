class ItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_task, only: [:new, :create, :destroy]

	def new
		@item = @task.items.new
	end


	def create
		@item = @task.items.create(item_params)
		@item.user_id = current_user.id
		@item.in_progress = false

		if @item.save
			redirect_to task_path(@task)
		else
			render 'new'
		end
	end

	def destroy
		@item = @task.items.find(params[:id])
		@item.destroy
		redirect_to task_path(@task)
	end

	def in_progress
		@item = Item.find(params[:task_id])
		@item.update_attribute(:in_progress, true)
		redirect_to task_path
	end

	def not_started
		@item = Item.find(params[:task_id])
		@item.update_attribute(:in_progress, false)
		redirect_to task_path
	end

	def complete
		@item = Item.find(params[:task_id])
		@item.update_attribute(:completed_at, Time.now)
		redirect_to task_path
	end

	private 

	def item_params
		params.require(:item).permit(:title, :description, :task_id)
	end

	def find_task
		@task = Task.find(params[:task_id])
	end


end
