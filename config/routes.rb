Rails.application.routes.draw do
  root "users#top"
  resources :users
  resources :folders, shallow: true do
    resources :codes
  end
  resources :spans

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
