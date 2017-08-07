Rails.application.routes.draw do
  get 'dojos/index' => 'dojos#index'
  get '/dojos/new' => 'dojos#new'
  post '/dojos/new' => "dojos#create"
  get '/index' => 'dojos#index'
  get '/' => 'dojos#index'
end
