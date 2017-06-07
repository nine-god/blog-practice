Rails.application.routes.draw do

  namespace :blog do
    get 'welcome/index'
  end

  devise_for :users
  root 'welcome#index',as: 'welcome_index'
  resources :users do 
  	resources :articles,only: [:index,:new,:create,:edit,:update]
  end
  
  resources :articles ,only: [:show,:destroy] do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
