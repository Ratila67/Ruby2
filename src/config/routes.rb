Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  get "weight_entries/index"
  root "weight_entries#index"
  resources :weight_entries
end