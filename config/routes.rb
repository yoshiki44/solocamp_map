Rails.application.routes.draw do
  get 'favorite/index'
  root "home#top"
  get "/" => "home#top"
  get "/index" => "home#index"
  get '/users/acount' => "users#acount"
  get '/users/profile' => "users#profile"
  post 'users/profile' => "profiles#update"
  get '/users/profiles/edit' => "profiles#edit"
  devise_for :users, controllers: {registrations: 'users/registrations',passwords: 'users/passwords'}
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users do
    member do
      get :bookmark
    end
  end
  resources :posts do
    resources :bookmarks, only: [:create, :destroy]
  end

end
