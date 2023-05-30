Rails.application.routes.draw do
  get 'index/index'
  resources :groups
  resources :expenses
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end

    unauthenticated do
      root 'index#index', as: :unauthenticated_root
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
