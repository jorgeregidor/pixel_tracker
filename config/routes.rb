Rails.application.routes.draw do
  resources :providers, except: [:index]
	
  devise_for :users
  
  root to: "providers#index"
end
