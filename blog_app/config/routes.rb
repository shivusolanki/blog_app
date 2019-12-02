Rails.application.routes.draw do
  devise_for :users

  resources :posts do
  	resources :comments
  	resources :likes
  end
  
  root "post#index"
  
  get '/about', to: 'pages#about'
end
