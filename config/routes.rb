Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :beers
    resources :beer_likes
    resources :breweries

    root to: "users#index"
  end

  resources :beers do
    member do
      get :like, :unlike
    end
  end
  devise_for :users
  resources :breweries

  resources :users, only: [:show], as: "/users/{:username}", as: "show_profile"


  match '/clear' => 'brewery_admin#clear', :via => 'get'
  match '/search' => "pages#search", :via => 'get', :as => "search"
  
  match '/:id' => "breweries#show", :via => 'get', :as => "main_brewery"
  match '/:brewery/beer/:id' => "beers#show", :via => 'get', :as => "main_beer"
  match '/:brewery/admin' => 'pages#index', :via => 'get'
  match '/:brewery/admin/:token' => "brewery_admin#index", :via => 'get', :as => "brewery_admin"
  match '/:brewery/admin/:beer/edit/:token' => "brewery_admin#edit", :via => 'get', :as => "brewery_edit"
 

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
