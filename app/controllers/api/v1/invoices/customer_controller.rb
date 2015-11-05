class Api::V1::Invoices::CustomerController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.for_invoice(params[:id])
  end
end
