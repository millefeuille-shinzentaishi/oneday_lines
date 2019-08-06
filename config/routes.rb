Rails.application.routes.draw do

  get 'records/new'
  root 'users#top'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'admin' => 'users#admin'
  delete 'all_destroy' => 'users#all_destroy'
  resources :users
  resources :folders, shallow: true do
    resources :codes
  end
  resources :spans

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
