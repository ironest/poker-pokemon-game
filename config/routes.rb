Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/robots", to: "robots#index", as: "robots"
  post "/robots", to: "robots#create"
  get "/robots/new", to: "robots#new", as: "new_robot"
  get "/robots/refresh", to: "robots#refresh", as: "refresh"
  get "/robots/:id", to: "robots#show", as: "robot"


end
