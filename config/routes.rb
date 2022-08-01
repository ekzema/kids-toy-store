Rails.application.routes.draw do
  namespace :api do
    namespace :v1, :format => 'json' do
      resources :products
      resources :categories
    end
  end

  get 'dashboard', to: 'dashboard#index'
  match "/dashboard/*path", to: "dashboard#index", format: false, via: :get

  root "store#index"
  match "*path", to: "store#index", format: false, via: :get
end
