Rails.application.routes.draw do
  root "store#index"
  get 'dashboard', to: 'dashboard#index'

  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
end
