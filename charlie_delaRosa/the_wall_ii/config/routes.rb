Rails.application.routes.draw do

root "users#new"
resources :users, only: [:new]
resources :messages, only: [:index, :create]

post "login" => "users#login"
delete "logout" => "users#logout"

# Prefix    Verb   URI Pattern          Controller#Action
# root      GET    /                    users#new
# new_user  GET    /users/new(.:format) users#new
# messages  GET    /messages(.:format)  messages#index
#           POST   /messages(.:format)  messages#create
# login     POST   /login(.:format)     users#login
# logout    DELETE /logout(.:format)    users#logout

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end