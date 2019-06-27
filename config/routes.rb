Rails.application.routes.draw do

	post "/api/v1/login", to: "api/v1/sessions#create"

	namespace :api do
		namespace :v1 do

		  resources :transactions
		  resources :accounts
		  resources :users
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
