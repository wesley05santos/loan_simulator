Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "home#index"

  # get 'loans', to: 'loans#show'
  get 'approve_loan', to: 'loans_requests#approve_loan'
  get 'reject_loan', to: 'loans_requests#reject_loan'
  get 'toggle_user_admin', to: 'users#toggle_user_admin'
  put 'pay_installment', to: 'loans#pay_installment'

  resources :payments, only: %i[new create]

  resources :loans
  resources :loans_requests
  resources :users
end
