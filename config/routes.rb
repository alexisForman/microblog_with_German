Rails.application.routes.draw do  
  root to: "pages#home"
  get '/about-us', to: "pages#about_us"
  get '/sign-up', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  resources :users, except: [:new]
  resources :categories
  resources :blogs

end
