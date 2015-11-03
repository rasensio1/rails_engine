Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/:object/random", to: "random#show", defaults: {format: :json}

      get "/merchants/find_all", to: "merchants#find_all"
      get "/merchants/find", to: "merchants#find"
      resources :merchants, only: [:index, :show]

      namespace :merchants do
        get "/:id/items", to: "items#index"
      end

      get "/items/find_all", to: "items#find_all"
      get "/items/find", to: "items#find"
      resources :items, only: [:index, :show]

      get "/invoice_items/find_all", to: "invoice_items#find_all"
      get "/invoice_items/find", to: "invoice_items#find"
      resources :invoice_items, only: [:index, :show]

      get "/invoices/find_all", to: "invoices#find_all"
      get "/invoices/find", to: "invoices#find"
      resources :invoices, only: [:index, :show]

      get "/transactions/find_all", to: "transactions#find_all"
      get "/transactions/find", to: "transactions#find"
      resources :transactions, only: [:index, :show]

      get "/customers/find_all", to: "customers#find_all"
      get "/customers/find", to: "customers#find"
      resources :customers, only: [:index, :show]
    end
  end

end
