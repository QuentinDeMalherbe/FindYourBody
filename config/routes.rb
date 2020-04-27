Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :activities do
    resources :books, only: [:new, :create] do
      get 'confirmation', to: 'pages#confirmation', as: 'confirmation'
    end
    resources :categories, only: [ :index, :new, :create]
  end
  get 'users/show/:id', to: 'users#show', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
