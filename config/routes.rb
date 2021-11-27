Rails.application.routes.draw do
  #get "/items", to: "items#index"

  resources :items
end
