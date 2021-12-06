Rails.application.routes.draw do


  devise_for :users
  root to: "home#index"

  get 'home/index'
  get 'about' => 'pages#about'

  resources :items do
    get :expensive, on: :collection
  end
  
  resources :items do
      member do
        put "like", to: "items#upvote"
        put "dislike", to: "items#downvote"
      end
   end

  get "admin/users_count" => "admin#users_count"

end
