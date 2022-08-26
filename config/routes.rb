Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :admin do
        resources :products
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

  root "store#index"
  match "*path", to: "store#index", format: false, via: :get
end
