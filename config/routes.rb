Rails.application.routes.draw do
  resources :users
  resources :movies do
    resources :registrations
  end
  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html

  # verb "url" => "name_of_controller#name_of_action"
  root "movies#index"
end
