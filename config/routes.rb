Rails.application.routes.draw do
  resources :items do
      member do
         put "like", to: "items#upvote"
         put "dislike", to: "items#downvote"
      end
   end
   
  devise_for :users
  root to: "home#index"

  get 'home/index'
  get 'about' => 'pages#about'

  #resources :items


end
