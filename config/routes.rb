Rails.application.routes.draw do
  resources :users do
    resources :workouts
  end
  get "/" => "sessions#new"
  post "/" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  root "sessions#new"
end
