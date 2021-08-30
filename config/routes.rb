Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  root to: "ledgers#index"
  resources :ledgers, except: [:index, :show] do
    resources :dashboard
    resources :accounts
    resources :transactions
    resources :categories
  end
  resources :accounts
  resources :transactions
  resources :dashboards
end
