class Api::V1::Items::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.where(item_id: params[:id]).to_json(methods: :price, except: :unit_price)
  end
end
