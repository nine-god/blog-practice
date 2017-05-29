Rails.application.routes.draw do

  root 'welcome#index'
  resources :users do 
  	# get '/articles/:id', to: 'users#show' , as 
  	resources :articles, only: [:index, :new,:create]
  end
  
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
