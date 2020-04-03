Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    api_version(:module => "V1", :path => {:value => "v1"}) do
      resources :books, only: [:index, :show]
      resources :user do
        resources :rents, only: [:index, :create]
      end
      resources :book_suggestions, only: [:create]
    end
  end
end
