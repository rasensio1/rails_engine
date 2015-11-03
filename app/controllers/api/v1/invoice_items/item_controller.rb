class Api::V1::InvoiceItems::ItemController < ApplicationController
  respond_to :json

  def show
    respond_with Item.joins(:invoice_items).where("invoice_items.id" => params[:id]).uniq
  end
end
