class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.joins(:invoice_items).where("invoice_items.id" => params[:id]).uniq
  end
end
