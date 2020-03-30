Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end

    defaults format: :json do
      namespace :v1 do
        resources :recipients
        resources :donors
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
