Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "/welcome", to: "home#index"
  get "home/index"
  root :to => "home#index"

  get "events", to: "events#new"
  #get "events/new", to: "events#new"
  get "events/:id", to: "events#show"
  get "events/:id/edit", to: "events#edit"

  #devise_for :users, :controllers => { registrations: 'registrations' }


  post "events", to: "events#create"
  patch "/events/:id", to:  "events#update", as: :event


  
end 


