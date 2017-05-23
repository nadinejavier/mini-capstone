Rails.application.routes.draw do

  #index of items
  get "/" => "items#index"
  get "/items" => "items#index"

  #add new item
  get "/items/new" => "items#new"
  post "/items" => "items#create"

  #suppliers
  get "/suppliers" => "suppliers#index"
  get "suppliers/new" => "suppliers#new"

  #item show/edit/delete page
  get "/items/:id" => "items#show"
  get "/items/:id/edit" => "items#edit"
  patch "/items/:id" => "items#update"
  delete "/items/:id" => "items#destroy"

  #item images
  get "/items/:id/images/new" => "images#new"
  post "/items/:id/images" => "images#create"

  #sign up
  get "/signup" => "users#new"
  post "/users" => "users#create"

  #login
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  #carted products/checkout
  post "/carted_products" => "carted_products#create"
  get "/carted_products" => "carted_products#index"

  #orders
 patch "/orders/:id" => "orders#update"
 get "/orders/:id" => "orders#show"

end
