Rails.application.routes.draw do

  root 'blog/welcome#index'

  namespace :blog do
    resources :welcome do 
      collection do
        get "index"
        get "home"
        get "test_ajax"
        post "test_ajax"
      end
    end
    get 'articles/test' ,to: 'articles#test',as: 'articles_test'
    resources :users do 
      resources :articles do 
        resources :comments
      end
    end
  end

  devise_for :users
  resources :users , only: [:show,:edit,:update,:index]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
