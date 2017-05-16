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


end
