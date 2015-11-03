class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index 
    respond_with Transaction.joins(:invoice).where("invoices.customer_id" => params[:id])
  end
end
