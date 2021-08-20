Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new,:create,:show,:index]
  resource :session, only:[:new,:create,:destroy]

  resources :subs, except: [:destroy] do
    resources :posts, only: [:index]
  end
  
  resources :posts
end
