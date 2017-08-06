Rails.application.routes.draw do
  get 'users/' => 'users#index'
  post 'users/' => 'users#create_user'
  get 'users/new' => 'users#new'
  get 'users/total' => 'users#total'
  get 'users/:id' => 'users#show_user_info'
  get 'users/:id/edit' => 'users#edit'
  post 'users/edit_user' => 'users#edit_user'
end
