Rails.application.routes.draw do
  root to: 'exchange_rates#index'
  resources :exchange_rates, only: [:index]
  get 'exchange_rates/calculate',
      to: 'exchange_rates#calculate', as: 'calculate'
end
