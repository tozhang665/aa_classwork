Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #shortcut to add all resources
  resources :users, only:[:index,:show,:update,:destroy,:create] do
    resources :artworks, only:[:index]
    resources :comments, only:[:index]
  end
  
  resources :artwork_shares, only:[:destroy,:create]

  resources :artworks, only:[:show,:update,:destroy,:create] do
    resources :comments, only:[:index]
  end
  # get 'users/:id', to: 'users#show', as: 'user'

  resources :comments, only:[:index,:create,:destroy]
end
