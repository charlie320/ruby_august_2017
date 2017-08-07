Rails.application.routes.draw do
  get '/' => 'users#index'
  post 'users/result' => 'users#result'
end
