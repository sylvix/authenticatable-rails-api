Rails.application.routes.draw do
  resources :users, except: [:new, :edit, :destroy]
  post 'session' => 'session#create', as: 'session_create'
end
