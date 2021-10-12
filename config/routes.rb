Rails.application.routes.draw do
  resources :users
  resources :tweets
  resources :likes
  root 'top#main'
  post 'top/login' => "top#login"
  get 'top/logout'
  get 'top/main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
