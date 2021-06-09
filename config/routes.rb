Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  resources :projects do
    resources :applications, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    get '/my_skills', to: 'users#my_skills', as: :my_skills
    resources :my_skills, only:[:create]
  end
end
