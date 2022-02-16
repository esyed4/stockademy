Rails.application.routes.draw do
  resources :stocks
  get 'profile/', to: "profile#index"
  get 'profile/show'
  get 'profile/edit'
  get 'profile/update'
  devise_for :users


  root 'root#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
