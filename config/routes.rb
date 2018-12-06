Rails.application.routes.draw do
  post 'pixels/new', to: 'pixels#new'
	get 'images/conversion', to: 'pixels#converion'

  resources :providers, except: [:index]
	
  devise_for :users
  
  root to: "providers#index"
end
