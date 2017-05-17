Rails.application.routes.draw do
  get "/" => "items#index"
  get "/items" => "items#index"


  get "/items/new" => "items#new"
  post "/items" => "items#create"

  get "/suppliers" => "suppliers#index"

  get "suppliers/new" => "suppliers#new"

  get "/items/:id" => "items#show"

  get "/items/:id/edit" => "items#edit"
  patch "/items/:id" => "items#update"

  delete "/items/:id" => "items#destroy"

  get "/items/:id/images/new" => "images#new"
  post "/items/:id/images" => "images#create"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"

  get "/logout" => "sessions#destroy"
end
