class Api::V1::Merchants::ItemsController < ApplicationController
  respond_to :json

  def index 
    respond_with Item.where(merchant_id: params[:id]).to_json(methods: :price, except: :unit_price)
  end
end
