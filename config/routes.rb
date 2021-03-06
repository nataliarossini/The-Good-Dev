Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get '/developers', to: 'pages#developers', as: :developers
  resources :projects do
    resources :chatrooms, only: :create
    resources :applications, only: [:new, :create]
    resources :reviews, only: [:new, :create]
    member do
      post :favorite
      post :unfavorite
    end
    resources :favorites, only: [:create] do
      collection do
        delete '/', action: :destroy
      end
    end
  end

  resources :applications, only: [] do
    get '/assess', to: 'applications#assess'
    patch '/', to: 'applications#respond'
  end

  resources :users, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    get '/my_skills', to: 'users#my_skills', as: :my_skills
    resources :my_skills, only:[:create]
    get '/my_languages', to: 'users#my_languages', as: :my_languages
    resources :my_languages, only:[:create]
  end
  resources :organizations, only: [:new, :create]
  resources :chatrooms, only: [:show] do
    resources :messages, only: :create
  end
end
