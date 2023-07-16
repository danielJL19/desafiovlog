Rails.application.routes.draw do
  get 'pages/home'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  devise_for :users, controllers:{sessions: 'users/sessions'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

end
