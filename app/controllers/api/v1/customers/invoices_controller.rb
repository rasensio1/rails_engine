class Api::V1::Customers::InvoicesController < ApplicationController
  respond_to :json

  def index 
    respond_with Invoice.find_by(customer_id: params[:id])
  end
end
