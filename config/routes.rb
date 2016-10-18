Rails.application.routes.draw do

  devise_for :users
  	resources :tasks do
		resources :items do
			member do 
				patch :complete
				patch :in_progress
				patch :not_started
			end
		end
	end
	root 'tasks#index'
end
