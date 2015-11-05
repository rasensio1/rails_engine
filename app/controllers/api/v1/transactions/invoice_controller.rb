class Api::V1::Transactions::InvoiceController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.for_transaction(params[:id])
  end
end
