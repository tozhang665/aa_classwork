Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: redirect('users')
  resources :users , only: [:index,:create,:new]
  resource :sessions, only: [:create, :new, :destroy]
end
