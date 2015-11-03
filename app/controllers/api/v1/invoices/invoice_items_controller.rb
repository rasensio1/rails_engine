class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  respond_to :json

  def index 
    respond_with InvoiceItem.where(invoice_id: params[:id]).to_json(methods: :price, except: :unit_price)
  end
end
