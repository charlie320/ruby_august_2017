Rails.application.routes.draw do

  get 'times/index' => 'times#index'

  get 'times/restart' => 'times#restart'

  get 'times' => 'times#index'

  # get "products" => "products#index"
  # get "products/new" => "products#new"
  # post "products" => "products#create"
  # get "products/:id" => "products#show"
  # get "products/:id/edit" => "products#edit"
  # patch "products/:id" => "products#update"
  # delete "products/:id" => "products#destroy"

  get 'hello' => 'hellos#hello'

  get 'say/hello' => 'hellos#say_hello'

  get 'say/hello/:name' => 'hellos#say_hello_name'

  get '/' => 'hellos#say'

end
