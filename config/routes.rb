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
  post '/login-student' =>  'sessions#login_student', as:'login_student'
  post '/login-instructor' =>  'sessions#login_instructor', as:'login_instructor'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/instructors/:id/reviews' => 'instructors#reviews', as: 'instructor_reviews'
  # get '/booking/mountain-instructor' =>  'bookings#new', as: 'book_with_mountain_instructor'
  # post '/booking/mountain-instructor' =>  'bookings#create', as: 'creat_with_mountain_instructor'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
