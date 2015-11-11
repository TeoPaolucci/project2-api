Rails.application.routes.draw do

  ## User Routes ##
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'
  resources :users, except: [:new, :edit]

  ## Game Routes ##
  get '/games' => 'games#index'
  get '/games/:id' => 'games#user_index'
end
