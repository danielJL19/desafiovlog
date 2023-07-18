Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'pages/home'

  resources :posts

  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

end
