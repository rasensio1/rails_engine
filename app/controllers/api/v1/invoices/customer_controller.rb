class Api::V1::Invoices::CustomerController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.joins(:invoices).where("invoices.customer_id" => params[:id]).uniq
  end
end
