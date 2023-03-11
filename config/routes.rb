Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :passwords, only: [:create, :update], param: :token
      resources :registrations, only: [:create] do
        collection do
          get 'check_email'
          put 'confirmation'
        end
      end
      resources :sessions, only: [:create] do
        collection do
          match "/", to: "sessions#destroy", via: "delete"
        end
      end
      resources :products, only: [:index, :show]

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

  root "shop#index"
  match "*path", to: "shop#index", format: false, via: :get
end
