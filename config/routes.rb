Rails.application.routes.draw do

  get "signin" => "sessions#new"
  resource :session # singular resource
  get "signup" => "users#new"
  get "movies/m/:scope" => "movies#index", as: :filtered_movies
  resources :users
  resources :movies do
    resources :favorites
    resources :registrations
  end
  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html

  # verb "url" => "name_of_controller#name_of_action"
  root "movies#index"
end
