class Api::V1::Invoices::ItemsController < ApplicationController
  respond_to :json

  def index 
    respond_with Item.joins(:invoices).where('invoices.id' => params[:id]).to_json(methods: :price, except: :unit_price)
  end
end
