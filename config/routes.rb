Rails.application.routes.draw do
  resources :transactions, only: [:index]
   root 'transactions#index'

  #get 'transactions/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
