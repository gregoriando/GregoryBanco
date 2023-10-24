Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :customers
  resources :bank_branches
  resources :bank_transactions
  resources :accounts
  post 'bank_transactions/transferir', to: 'bank_transactions#transferir'
  post 'bank_transactions/depositar', to: 'bank_transactions#depositar'
  post 'bank_transactions/pagar', to: 'bank_transactions#pagar'



end
