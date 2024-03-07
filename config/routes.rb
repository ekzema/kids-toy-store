Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: [:index, :show]
      resources :wishlists,  only: [:index, :create]
      resources :line_items, only: [:create, :update, :destroy]
      resources :passwords,  only: [:create, :update], param: :token
      resources :orders,  only: [:create, :index, :show] do
        collection do
          get :detail_constructor
        end
      end
      resources :registrations, only: [:create] do
        collection do
          get 'check_email'
          put 'confirmation'
        end
      end
      resources :sessions, only: [:create] do
        collection do
          match '/', to: 'sessions#destroy', via: 'delete'
        end
      end
      resources :users, only: [:destroy] do
        collection do
          get 'info'
          put 'update_account'
          put 'change_password'
        end
      end
      resources :products, only: [:index, :show] do
        collection do
          get 'autocomplete'
        end
      end

      namespace :admin do
        resources :product_images, only: [:destroy]
        resources :brands, only: [:index]
        resources :orders, only: [:index, :show, :update]
        resources :line_items, only: [:update, :destroy]
        resources :products do
          collection do
            get :detail_constructor
          end
        end
        resources :categories do
          collection do
            get :parents
          end
        end
      end
    end
  end

  get 'dashboard', to: 'dashboard#index'
  match "/dashboard/*path", to: "dashboard#index", format: false, via: :get

  root "shop#index"
  match "*path", to: "shop#index", format: false, via: :get
end
