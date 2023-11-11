Rails.application.routes.draw do
  root "home#top"
  get "/" => "home#top"
  get '/users/acount' => "users#acount"
  get '/users/profile' => "users#profile"
  post 'users/profile' => "profiles#update"
  get '/users/profiles/edit' => "profiles#edit"
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
