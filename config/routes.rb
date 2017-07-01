Rails.application.routes.draw do

  root 'welcome#index',as: 'welcome_index'

  namespace :blog do
    get 'welcome/index'
    get 'articles/test' ,to: 'articles#test',as: 'articles_test'
    resources :users do 
      resources :articles do 
        resources :comments
      end
    end
  end

  devise_for :users
    resources :users




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
