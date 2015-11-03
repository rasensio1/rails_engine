Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index], defaults: {format: :json}
      resources :items, only: [:index], defaults: {format: :json}
    end
  end
end
