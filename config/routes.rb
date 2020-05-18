Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  devise_for :users

  resources :profiles, only: %i[index show new create edit update]
  resources :jobs, only: %i[index show new create]do
    get 'search', on: :collection    
    resources :apply_jobs, only: %i[new create]
  end


end
