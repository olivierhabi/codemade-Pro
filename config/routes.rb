Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'pages/about'
  get '/myprojects' => 'project#list'
  post '/free' => 'charge#free'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "project#index"

  resources :project do
    resources :task, only: [:show]
  end

end
