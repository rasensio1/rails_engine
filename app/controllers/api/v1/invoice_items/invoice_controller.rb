class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.for_invoice_item(params[:id])
  end
end
