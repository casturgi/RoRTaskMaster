Rails.application.routes.draw do

  devise_for :users
  	resources :tasks do
		resources :items do
			member do 
				patch :complete
			end
		end
	end
	root 'tasks#index'
end
