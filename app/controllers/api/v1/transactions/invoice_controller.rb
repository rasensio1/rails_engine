class Api::V1::Transactions::InvoiceController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.joins(:transactions).where("transactions.id" => params[:id])
  end
end
