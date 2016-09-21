class ItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_item, only: [:edit, :update, :destroy]
	before_action :find_task, only: [:new, :create, :edit, :update, :destroy]

	def new
		@item = @task.items.new
	end


	def create

		@item = @task.items.create(item_params)
		@item.user_id = current_user.id

		if @item.save
			redirect_to task_path(@task)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @item.update(item_params)
			redirect_to	task_path(@task)
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to task_path(@task)
	end

	def complete
		@item = Item.find(params[:id])
		@item.update_attribute(:completed_at, Time.now)
		redirect_to root_path
	end

	private 

	def item_params
		params.require(:item).permit(:title, :description, :task_id)
	end

	def find_item
		@item = Item.find(params[:id])
	end

	def find_task
		@task = Task.find(params[:task_id])
	end
end
