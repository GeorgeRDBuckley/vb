Rails.application.routes.draw do
  resources :beers do
    member do
      get :like, :unlike
    end
  end
  devise_for :users
  resources :breweries

  resources :users, only: [:show], as: "/users/{:username}", as: "show_profile"

  match '/search' => "pages#search", :via => 'get', :as => "search"
  
  match '/:id' => "breweries#show", :via => 'get', :as => "main_brewery"
  match '/:brewery/beer/:id' => "beers#show", :via => 'get', :as => "main_beer"

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
