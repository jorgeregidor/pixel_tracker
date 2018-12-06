Rails.application.routes.draw do
  post 'pixels', to: 'pixels#create'
	get 'images/conversion', to: 'pixels#conversion'

  resources :providers, except: [:index]
	
  devise_for :users
  
  root to: "providers#index"
end
