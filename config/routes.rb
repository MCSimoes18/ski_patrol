Rails.application.routes.draw do
  resources :reviews
  resources :mountain_instructors
  resources :mountains
  resources :bookings
  resources :instructors
  resources :students

  root 'sessions#new'
  get '/login' =>  'sessions#new', as: 'login'
  # post '/login_inst'
  post '/login' =>  'sessions#create_student'
  post '/login' =>  'sessions#create_intructor'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
