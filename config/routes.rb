Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :passwords, :only => [:create, :update]
      resources :registrations, :only => [:create]
      resources :sessions, :only => [:create] do
        collection do
          match "/", to: "sessions#destroy", via: "delete"
        end
      end

      namespace :admin do
        resources :products do
          collection do
            get :detail_constructor
          end
        end
        resources :product_images, only: [:destroy]
        resources :categories do
          collection do
            get :parents
          end
        end
        resources :brands, only: [:index]
      end
    end
  end

  get 'dashboard', to: 'dashboard#index'
  match "/dashboard/*path", to: "dashboard#index", format: false, via: :get

  root "store#index"
  match "*path", to: "store#index", format: false, via: :get
end
