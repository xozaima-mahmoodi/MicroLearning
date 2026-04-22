Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :categories, only: [ :index ], param: :slug
      resources :domains, only: [ :index, :show ], param: :slug do
        resources :concepts, only: [ :index ], param: :slug
      end
      resources :concepts, only: [ :show ], param: :slug
    end
  end
end
