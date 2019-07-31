Rails.application.routes.draw do
  root "users#top"
  get 'codes/new'
  get 'folders/new'
  get 'spans/new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
