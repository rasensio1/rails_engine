Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/:object/random", to: "random#show"

      get "/merchants/find_all", to: "merchants#find_all"
      get "/merchants/find", to: "merchants#find"
      resources :merchants, only: [:index, :show]
      namespace :merchants do
        get "/:id/items", to: "items#index"
        get "/:id/invoices", to: "invoices#index"
      end

      get "/items/find_all", to: "items#find_all"
      get "/items/find", to: "items#find"
      resources :items, only: [:index, :show]
      namespace :items do
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/merchant", to: "merchant#show"
      end

      get "/invoice_items/find_all", to: "invoice_items#find_all"
      get "/invoice_items/find", to: "invoice_items#find"
      resources :invoice_items, only: [:index, :show]
      namespace :invoice_items do
        get "/:id/invoice", to: "invoice#show"
        get "/:id/item", to: "item#show"
      end

      get "/invoices/find_all", to: "invoices#find_all"
      get "/invoices/find", to: "invoices#find"
      resources :invoices, only: [:index, :show]
      namespace :invoices do
        get "/:id/transactions", to: "transactions#index"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/items", to: "items#index"
        get "/:id/customer", to: "customer#show"
        get "/:id/merchant", to: "merchant#show"
      end

      get "/transactions/find_all", to: "transactions#find_all"
      get "/transactions/find", to: "transactions#find"
      resources :transactions, only: [:index, :show]
      namespace :transactions do
        get "/:id/invoice", to: "invoice#show"
      end

      get "/customers/find_all", to: "customers#find_all"
      get "/customers/find", to: "customers#find"
      resources :customers, only: [:index, :show]
      namespace :customers do
        get "/:id/invoices", to: "invoices#index"
        get "/:id/transactions", to: "transactions#index"
      end
    end
  end

end
