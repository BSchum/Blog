Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :posts do
    resources :comments
  end
  get '/categories/:category_id', to: 'posts#index', as: 'categories_index'
  get '/search', to: 'posts#index'  
  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
