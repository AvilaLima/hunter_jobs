Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  devise_for :users

  resources :profiles, only: %i[index show new create edit update] do
    get 'favorite', on: :member
  end
  
  resources :comments, only: %i[new create index]
  
  resources :jobs, only: %i[index show new create] do
    get 'search', on: :collection
    get 'myjobs', on: :collection
    get 'close', on: :member
    resources :apply_jobs, only: %i[new create] do
      get 'send_reject', on: :member      
      post 'reject', on: :collection      
    end
  end

end
