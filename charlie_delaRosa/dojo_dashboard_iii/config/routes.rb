Rails.application.routes.draw do
  get '/index' => 'dojos#index'
  get 'dojos/index' => 'dojos#index'
  get '/dojos/new' => 'dojos#new'
  post '/dojos/new' => 'dojos#create'
  get 'dojos/:id' => 'dojos#show', as: :dojo
  get 'dojos/:id/edit' => 'dojos#edit', as: :edit_dojo
  post 'dojos/:id' => 'dojos#update', as: :dojo_update
  delete 'dojos/:id' => 'dojos#destroy', as: :dojo_delete

  get '/' => 'dojos#index'

  # get "products" => "products#index"
  # get "products/new" => "products#new"
  # post "products" => "products#create"
  # get "products/:id" => "products#show"
  # get "products/:id/edit" => "products#edit"
  # patch "products/:id" => "products#update"
  # delete "products/:id" => "products#destroy"


end
