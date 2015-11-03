Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/:object/random", to: "random#show", defaults: {format: :json}

      get "/merchants/find_all", to: "merchants#find_all", defaults: {format: :json}
      get "/merchants/find", to: "merchants#find", defaults: {format: :json}
      resources :merchants, only: [:index, :show], defaults: {format: :json}

      get "/items/find_all", to: "items#find_all", defaults: {format: :json}
      get "/items/find", to: "items#find", defaults: {format: :json}
      resources :items, only: [:index, :show], defaults: {format: :json}

      get "/invoice_items/find_all", to: "invoice_items#find_all", defaults: {format: :json}
      get "/invoice_items/find", to: "invoice_items#find", defaults: {format: :json}
      resources :invoice_items, only: [:index, :show], defaults: {format: :json}

      get "/invoices/find_all", to: "invoices#find_all", defaults: {format: :json}
      get "/invoices/find", to: "invoices#find", defaults: {format: :json}
      resources :invoices, only: [:index, :show], defaults: {format: :json}

      get "/transactions/find_all", to: "transactions#find_all", defaults: {format: :json}
      get "/transactions/find", to: "transactions#find", defaults: {format: :json}
      resources :transactions, only: [:index, :show], defaults: {format: :json}

      get "/customers/find_all", to: "customers#find_all", defaults: {format: :json}
      get "/customers/find", to: "customers#find", defaults: {format: :json}
      resources :customers, only: [:index, :show], defaults: {format: :json}
    end
  end
end
