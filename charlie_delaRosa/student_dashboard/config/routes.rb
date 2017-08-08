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

  get '/dojos/:dojo_id/students' => 'students#index', as: :dojo_students
  get '/dojos/:dojo_id/students/new' => 'students#new', as: :students_new
  post 'dojos/:dojo_id/students' => 'students#create', as: :students_create
  get 'dojos/:dojo_id/students/:id' => 'students#show', as: :students_show
  get 'dojos/:dojo_id/students/:id/edit' => 'students#edit', as: :students_edit
  post 'dojos/:dojo_id/students/:id' => 'students#update', as: :students_update
  delete 'dojos/:dojo_id/students/:id' => 'students#destroy', as: :students_destroy

end
